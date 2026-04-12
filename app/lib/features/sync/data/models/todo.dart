import 'package:isar/isar.dart';
import 'goal.dart';
import 'work_session.dart';
import 'tag.dart';

part 'todo.g.dart';

enum TodoStatus {
  draft,
  inProgress,
  waiting,
  completed,
}

enum TodoSourceType {
  native,
  github,
  msTodo,
}

@collection
class Todo {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? externalId; // UUID from backend

  String? parentExternalId;
  String? goalExternalId;
  
  late String ownerExternalId;
  String? assigneeExternalId;

  @Enumerated(EnumType.name)
  TodoSourceType sourceType = TodoSourceType.native;
  
  String? externalSourceId; // e.g., GitHub PR ID
  
  late String title;
  String? description;
  
  DateTime? startDate;
  DateTime? dueDate;
  
  @Enumerated(EnumType.name)
  TodoStatus status = TodoStatus.draft;
  
  int estimatedDuration = 0; // in minutes

  DateTime? createdAt;
  DateTime? updatedAt;

  final goal = IsarLink<Goal>();
  final parent = IsarLink<Todo>();

  @Backlink(to: 'parent')
  final subTodos = IsarLinks<Todo>();

  @Backlink(to: 'todo')
  final workSessions = IsarLinks<WorkSession>();

  final tags = IsarLinks<Tag>();
}
