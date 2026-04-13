import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/enums.dart';

part 'app_database.g.dart';

// --- Converters ---

class TodoStatusConverter extends TypeConverter<TodoStatus, String> {
  const TodoStatusConverter();
  @override
  TodoStatus fromSql(String fromDb) => TodoStatus.values.byName(fromDb);
  @override
  String toSql(TodoStatus value) => value.name;
}

class TodoSourceTypeConverter extends TypeConverter<TodoSourceType, String> {
  const TodoSourceTypeConverter();
  @override
  TodoSourceType fromSql(String fromDb) => TodoSourceType.values.byName(fromDb);
  @override
  String toSql(TodoSourceType value) => value.name;
}

class TodoImportanceConverter extends TypeConverter<TodoImportance, String> {
  const TodoImportanceConverter();
  @override
  TodoImportance fromSql(String fromDb) => TodoImportance.values.byName(fromDb);
  @override
  String toSql(TodoImportance value) => value.name;
}

class WorkSessionStatusConverter extends TypeConverter<WorkSessionStatus, String> {
  const WorkSessionStatusConverter();
  @override
  WorkSessionStatus fromSql(String fromDb) => WorkSessionStatus.values.byName(fromDb);
  @override
  String toSql(WorkSessionStatus value) => value.name;
}

// --- Tables ---

class Users extends Table {
  TextColumn get externalId => text()();
  TextColumn get email => text().withLength(min: 3, max: 255)();
  TextColumn get fullName => text().withLength(min: 1, max: 255)();
  TextColumn get timezone => text().withDefault(const Constant('UTC'))();
  
  @override
  Set<Column> get primaryKey => {externalId};
}

class Goals extends Table {
  TextColumn get externalId => text()();
  TextColumn get ownerExternalId => text().references(Users, #externalId)();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {externalId};
}

class Tags extends Table {
  TextColumn get externalId => text()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get category => text().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get parentExternalId => text().nullable().references(Tags, #externalId)();

  @override
  Set<Column> get primaryKey => {externalId};
}

class Todos extends Table {
  TextColumn get externalId => text()();
  TextColumn get parentExternalId => text().nullable().references(Todos, #externalId)();
  TextColumn get goalExternalId => text().nullable().references(Goals, #externalId)();
  TextColumn get ownerExternalId => text().references(Users, #externalId)();
  TextColumn get assigneeExternalId => text().nullable().references(Users, #externalId)();

  TextColumn get sourceType => text().map(const TodoSourceTypeConverter())();
  TextColumn get externalSourceId => text().nullable()();
  
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().nullable()();
  
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  
  TextColumn get status => text().map(const TodoStatusConverter())();
  TextColumn get importance => text().map(const TodoImportanceConverter())();
  
  IntColumn get estimatedDuration => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {externalId};
}

class TodoTags extends Table {
  TextColumn get todoExternalId => text().references(Todos, #externalId)();
  TextColumn get tagExternalId => text().references(Tags, #externalId)();

  @override
  Set<Column> get primaryKey => {todoExternalId, tagExternalId};
}

class WorkSessions extends Table {
  TextColumn get externalId => text()();
  TextColumn get todoExternalId => text().references(Todos, #externalId)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get status => text().map(const WorkSessionStatusConverter())();

  @override
  Set<Column> get primaryKey => {externalId};
}

// --- Data Classes ---

class TodoWithTags {
  final Todo todo;
  final List<Tag> tags;

  TodoWithTags(this.todo, this.tags);
}

// --- Database ---

@DriftDatabase(tables: [Users, Goals, Tags, Todos, TodoTags, WorkSessions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'flowhub_db',
      web: kIsWeb
          ? DriftWebOptions(
              sqlite3Wasm: Uri.parse('sqlite3.wasm'),
              driftWorker: Uri.parse('drift_worker.js'),
            )
          : null,
    );
  }
}
