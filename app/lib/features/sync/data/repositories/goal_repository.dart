import 'package:isar/isar.dart';
import '../models/goal.dart';

class GoalRepository {
  final Isar isar;

  GoalRepository(this.isar);

  Future<List<Goal>> getAllGoals() async {
    return await isar.goals.where().findAll();
  }

  Future<Goal?> getGoalById(Id id) async {
    return await isar.goals.get(id);
  }

  Future<void> saveGoal(Goal goal) async {
    await isar.writeTxn(() async {
      await isar.goals.put(goal);
    });
  }

  Future<void> deleteGoal(Id id) async {
    await isar.writeTxn(() async {
      await isar.goals.delete(id);
    });
  }

  Stream<List<Goal>> watchGoals() {
    return isar.goals.where().watch(fireImmediately: true);
  }
}
