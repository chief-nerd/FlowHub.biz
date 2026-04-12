import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/models/enums.dart';

class TodoRepository {
  final AppDatabase db;

  TodoRepository(this.db);

  Future<List<TodoWithTags>> getAllTodos() async {
    final todos = await db.select(db.todos).get();
    final result = <TodoWithTags>[];
    for (final todo in todos) {
      final tags = await _getTagsForTodo(todo.externalId);
      result.add(TodoWithTags(todo, tags));
    }
    return result;
  }

  Future<TodoWithTags?> getTodoById(String externalId) async {
    final todo = await (db.select(db.todos)..where((t) => t.externalId.equals(externalId))).getSingleOrNull();
    if (todo == null) return null;
    final tags = await _getTagsForTodo(externalId);
    return TodoWithTags(todo, tags);
  }

  Future<List<Tag>> _getTagsForTodo(String todoExternalId) async {
    final query = db.select(db.tags).join([
      innerJoin(db.todoTags, db.todoTags.tagExternalId.equalsExp(db.tags.externalId)),
    ])..where(db.todoTags.todoExternalId.equals(todoExternalId));
    
    final rows = await query.get();
    return rows.map((row) => row.readTable(db.tags)).toList();
  }

  Future<void> saveTodo(Todo todo, {List<String> tagIds = const []}) async {
    await db.transaction(() async {
      await db.into(db.todos).insertOnConflictUpdate(todo);

      // Update tags
      await (db.delete(db.todoTags)..where((t) => t.todoExternalId.equals(todo.externalId))).go();
      for (final tagId in tagIds) {
        await db.into(db.todoTags).insert(TodoTag(todoExternalId: todo.externalId, tagExternalId: tagId));
      }

      // Epic 2.6: Auto-transition Goal to 'Completed' when all children are completed.
      if (todo.goalExternalId != null) {
        final goalExternalId = todo.goalExternalId!;
        final allGoalTodos = await (db.select(db.todos)..where((t) => t.goalExternalId.equals(goalExternalId))).get();
        
        bool allCompleted = allGoalTodos.isNotEmpty && allGoalTodos.every((t) => t.status == TodoStatus.completed);
        
        if (allCompleted) {
          // Logic to update goal status would go here
        }
      }
    });
  }

  Future<void> deleteTodo(String externalId) async {
    await db.transaction(() async {
      await _deleteSubTodosRecursive(externalId);
      await (db.delete(db.todos)..where((t) => t.externalId.equals(externalId))).go();
    });
  }

  Future<void> _deleteSubTodosRecursive(String parentExternalId) async {
    final subTodos = await (db.select(db.todos)..where((t) => t.parentExternalId.equals(parentExternalId))).get();
    for (final child in subTodos) {
      await _deleteSubTodosRecursive(child.externalId);
      await (db.delete(db.todos)..where((t) => t.externalId.equals(child.externalId))).go();
    }
  }

  Stream<List<TodoWithTags>> watchTodos() {
    return db.select(db.todos).watch().switchMap((todos) {
      if (todos.isEmpty) return Stream.value([]);
      
      final streams = todos.map((todo) {
        return (db.select(db.tags).join([
          innerJoin(db.todoTags, db.todoTags.tagExternalId.equalsExp(db.tags.externalId)),
        ])..where(db.todoTags.todoExternalId.equals(todo.externalId)))
        .watch()
        .map((rows) => TodoWithTags(todo, rows.map((row) => row.readTable(db.tags)).toList()));
      });
      
      return Rx.combineLatestList(streams);
    });
  }

  Future<List<TodoWithTags>> getTodosByGoal(String goalExternalId) async {
    final todos = await (db.select(db.todos)..where((t) => t.goalExternalId.equals(goalExternalId))).get();
    final result = <TodoWithTags>[];
    for (final todo in todos) {
      final tags = await _getTagsForTodo(todo.externalId);
      result.add(TodoWithTags(todo, tags));
    }
    return result;
  }

  Future<List<TodoWithTags>> getSubTodos(String parentExternalId) async {
    final todos = await (db.select(db.todos)..where((t) => t.parentExternalId.equals(parentExternalId))).get();
    final result = <TodoWithTags>[];
    for (final todo in todos) {
      final tags = await _getTagsForTodo(todo.externalId);
      result.add(TodoWithTags(todo, tags));
    }
    return result;
  }
}
