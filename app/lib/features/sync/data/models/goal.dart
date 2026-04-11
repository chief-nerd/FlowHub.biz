import 'package:isar/isar.dart';
import 'todo.dart';

part 'goal.g.dart';

@collection
class Goal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? externalId; // UUID from backend

  late String ownerExternalId;
  
  late String title;
  
  String? description;
  
  bool isCompleted = false;

  DateTime? createdAt;
  DateTime? updatedAt;

  @Backlink(to: 'goal')
  final todos = IsarLinks<Todo>();
}
