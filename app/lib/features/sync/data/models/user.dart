import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? externalId; // UUID from backend

  @Index(unique: true)
  late String email;
  
  late String fullName;
  
  String timezone = 'UTC';
  
  DateTime afterworkStartTime = DateTime(2021, 1, 1, 17, 0);

  DateTime? createdAt;
  DateTime? updatedAt;
}
