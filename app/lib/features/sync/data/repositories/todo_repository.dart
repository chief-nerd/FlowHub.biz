import 'package:isar/isar.dart';
import '../models/todo.dart';

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
    });
  }

  Future<void> deleteTodo(Id id) async {
    await isar.writeTxn(() async {
      await isar.todos.delete(id);
    });
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
