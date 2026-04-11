import 'package:isar/isar.dart';
import '../models/todo.dart';
import '../models/goal.dart';

class TodoRepository {
  final Isar isar;

  TodoRepository(this.isar);

  Future<List<Todo>> getAllTodos() async {
    return await isar.todos.where().findAll();
  }

  Future<Todo?> getTodoById(Id id) async {
    return await isar.todos.get(id);
  }

  Future<void> saveTodo(Todo todo) async {
    await isar.writeTxn(() async {
      await isar.todos.put(todo);
      await todo.goal.save();
      await todo.parent.save();

      // Epic 2.6: Auto-transition Goal to 'Completed' when all children are completed.
      if (todo.goalExternalId != null) {
        final goal = await isar.goals.filter().externalIdEqualTo(todo.goalExternalId!).findFirst();
        if (goal != null) {
          final allGoalTodos = await isar.todos.filter().goalExternalIdEqualTo(goal.externalId).findAll();
          
          bool allCompleted = true;
          if (allGoalTodos.isEmpty) {
            allCompleted = false;
          } else {
            for (final t in allGoalTodos) {
              if (t.status != TodoStatus.completed) {
                allCompleted = false;
                break;
              }
            }
          }
          
          if (goal.isCompleted != allCompleted) {
            goal.isCompleted = allCompleted;
            await isar.goals.put(goal);
          }
        }
      }

      // Epic 2.7: Todo logic: Require manual transition to "Completed" even if children are done.
      // Therefore, we DO NOT auto-complete parent Todos here. They stay in their current status.
    });
  }

  Future<void> deleteTodo(Id id) async {
    await isar.writeTxn(() async {
      final todo = await isar.todos.get(id);
      if (todo != null) {
        final goalExternalId = todo.goalExternalId;
        final externalId = todo.externalId;
        
        // Recursively delete sub-todos
        if (externalId != null) {
          await _deleteSubTodosRecursive(externalId);
        }
        
        await isar.todos.delete(id);
        
        if (goalExternalId != null) {
          final goal = await isar.goals.filter().externalIdEqualTo(goalExternalId).findFirst();
          if (goal != null) {
            final allGoalTodos = await isar.todos.filter().goalExternalIdEqualTo(goal.externalId).findAll();
            
            bool allCompleted = true;
            if (allGoalTodos.isEmpty) {
              allCompleted = false;
            } else {
              for (final t in allGoalTodos) {
                if (t.status != TodoStatus.completed) {
                  allCompleted = false;
                  break;
                }
              }
            }
            
            if (goal.isCompleted != allCompleted) {
              goal.isCompleted = allCompleted;
              await isar.goals.put(goal);
            }
          }
        }
      }
    });
  }

  Future<void> _deleteSubTodosRecursive(String parentExternalId) async {
    final subTodos = await isar.todos.filter().parentExternalIdEqualTo(parentExternalId).findAll();
    for (final child in subTodos) {
      if (child.externalId != null) {
        await _deleteSubTodosRecursive(child.externalId!);
      }
      await isar.todos.delete(child.id);
    }
  }

  Stream<List<Todo>> watchTodos() {
    return isar.todos.where().watch(fireImmediately: true);
  }

  Future<List<Todo>> getTodosByGoal(String goalExternalId) async {
    return await isar.todos.filter().goalExternalIdEqualTo(goalExternalId).findAll();
  }

  Future<List<Todo>> getSubTodos(String parentExternalId) async {
    return await isar.todos.filter().parentExternalIdEqualTo(parentExternalId).findAll();
  }
}
