import '../../../../core/db/app_database.dart';

class GoalRepository {
  final AppDatabase db;

  GoalRepository(this.db);

  Future<List<Goal>> getAllGoals() async {
    return await db.select(db.goals).get();
  }

  Future<Goal?> getGoalById(String externalId) async {
    return await (db.select(db.goals)..where((g) => g.externalId.equals(externalId))).getSingleOrNull();
  }

  Future<void> saveGoal(Goal goal) async {
    await db.into(db.goals).insertOnConflictUpdate(goal);
  }

  Future<void> deleteGoal(String externalId) async {
    await (db.delete(db.goals)..where((g) => g.externalId.equals(externalId))).go();
  }

  Stream<List<Goal>> watchGoals() {
    return db.select(db.goals).watch();
  }
}
