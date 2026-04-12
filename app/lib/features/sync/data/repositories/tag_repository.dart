import '../../../../core/db/app_database.dart';

class TagRepository {
  final AppDatabase db;

  TagRepository(this.db);

  Stream<List<Tag>> watchTags() {
    return db.select(db.tags).watch();
  }

  Future<List<Tag>> getAllTags() async {
    return db.select(db.tags).get();
  }

  Future<void> saveTag(Tag tag) async {
    await db.into(db.tags).insertOnConflictUpdate(tag);
  }

  Future<void> deleteTag(String externalId) async {
    await (db.delete(db.tags)..where((t) => t.externalId.equals(externalId))).go();
  }
}
