import 'package:isar/isar.dart';
import 'todo.dart';

part 'tag.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? externalId;

  @Index()
  late String name;

  @Index()
  String? category;

  String? color; // Hex string e.g., #RRGGBB

  final parent = IsarLink<Tag>();

  @Backlink(to: 'parent')
  final subtags = IsarLinks<Tag>();

  @Backlink(to: 'tags')
  final todos = IsarLinks<Todo>();

  String get displayName => category != null ? '$category/$name' : name;
}
