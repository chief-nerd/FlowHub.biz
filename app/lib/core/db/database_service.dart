import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/sync/data/models/user.dart';
import '../../features/sync/data/models/goal.dart';
import '../../features/sync/data/models/todo.dart';
import '../../features/sync/data/models/work_session.dart';

class DatabaseService {
  late Isar _isar;

  Isar get isar => _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema, GoalSchema, TodoSchema, WorkSessionSchema],
      directory: dir.path,
    );
  }

  Future<void> clear() async {
    await _isar.writeTxn(() => _isar.clear());
  }
}
