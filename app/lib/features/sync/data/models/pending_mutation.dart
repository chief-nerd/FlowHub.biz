import 'package:isar/isar.dart';

part 'pending_mutation.g.dart';

enum MutationType {
  create,
  update,
  delete,
}

enum EntityType {
  goal,
  todo,
  workSession,
}

@collection
class PendingMutation {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  late EntityType entityType;

  @Enumerated(EnumType.name)
  late MutationType mutationType;

  late String entityExternalId;
  
  // JSON stringified data for the mutation
  String? data;

  DateTime createdAt = DateTime.now();
}
