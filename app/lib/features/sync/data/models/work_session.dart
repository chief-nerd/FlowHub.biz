import 'package:isar/isar.dart';
import 'todo.dart';

part 'work_session.g.dart';

enum WorkSessionStatus {
  scheduled,
  logged,
  ghost,
}

@collection
class WorkSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? externalId; // UUID from backend

  late String todoExternalId;
  
  late DateTime startTime;
  late DateTime endTime;
  
  @Enumerated(EnumType.name)
  WorkSessionStatus status = WorkSessionStatus.scheduled;

  DateTime? createdAt;
  DateTime? updatedAt;

  final todo = IsarLink<Todo>();
}
