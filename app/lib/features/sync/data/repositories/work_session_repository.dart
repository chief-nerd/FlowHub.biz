import '../../../../core/db/app_database.dart';

class WorkSessionRepository {
  final AppDatabase db;

  WorkSessionRepository(this.db);

  Future<List<WorkSession>> getAllWorkSessions() async {
    return await db.select(db.workSessions).get();
  }

  Future<WorkSession?> getWorkSessionById(String externalId) async {
    return await (db.select(db.workSessions)..where((s) => s.externalId.equals(externalId))).getSingleOrNull();
  }

  Future<void> saveWorkSession(WorkSession session) async {
    await db.into(db.workSessions).insertOnConflictUpdate(session);
  }

  Future<void> deleteWorkSession(String externalId) async {
    await (db.delete(db.workSessions)..where((s) => s.externalId.equals(externalId))).go();
  }

  Future<List<WorkSession>> getSessionsByTodo(String todoExternalId) async {
    return await (db.select(db.workSessions)..where((s) => s.todoExternalId.equals(todoExternalId))).get();
  }
}
