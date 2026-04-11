import 'package:isar/isar.dart';
import '../models/work_session.dart';

class WorkSessionRepository {
  final Isar isar;

  WorkSessionRepository(this.isar);

  Future<List<WorkSession>> getAllWorkSessions() async {
    return await isar.workSessions.where().findAll();
  }

  Future<WorkSession?> getWorkSessionById(Id id) async {
    return await isar.workSessions.get(id);
  }

  Future<void> saveWorkSession(WorkSession session) async {
    await isar.writeTxn(() async {
      await isar.workSessions.put(session);
      await session.todo.save();
    });
  }

  Future<void> deleteWorkSession(Id id) async {
    await isar.writeTxn(() async {
      await isar.workSessions.delete(id);
    });
  }

  Future<List<WorkSession>> getSessionsByTodo(String todoExternalId) async {
    return await isar.workSessions.filter().todoExternalIdEqualTo(todoExternalId).findAll();
  }
}
