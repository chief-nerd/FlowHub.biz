import 'package:isar/isar.dart';
import '../models/tag.dart';

class TagRepository {
  final Isar isar;

  TagRepository(this.isar);

  Stream<List<Tag>> watchTags() {
    return isar.tags.where().watch(fireImmediately: true);
  }

  Future<List<Tag>> getAllTags() async {
    return isar.tags.where().findAll();
  }

  Future<void> saveTag(Tag tag) async {
    await isar.writeTxn(() async {
      await isar.tags.put(tag);
    });
  }

  Future<void> deleteTag(Id id) async {
    await isar.writeTxn(() async {
      await isar.tags.delete(id);
    });
  }
}
