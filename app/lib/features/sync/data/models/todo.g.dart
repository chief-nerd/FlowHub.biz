// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoCollection on Isar {
  IsarCollection<Todo> get todos => this.collection();
}

const TodoSchema = CollectionSchema(
  name: r'Todo',
  id: -505491818817781703,
  properties: {
    r'assigneeExternalId': PropertySchema(
      id: 0,
      name: r'assigneeExternalId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 3,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'estimatedDuration': PropertySchema(
      id: 4,
      name: r'estimatedDuration',
      type: IsarType.long,
    ),
    r'externalId': PropertySchema(
      id: 5,
      name: r'externalId',
      type: IsarType.string,
    ),
    r'externalSourceId': PropertySchema(
      id: 6,
      name: r'externalSourceId',
      type: IsarType.string,
    ),
    r'goalExternalId': PropertySchema(
      id: 7,
      name: r'goalExternalId',
      type: IsarType.string,
    ),
    r'importance': PropertySchema(
      id: 8,
      name: r'importance',
      type: IsarType.string,
      enumMap: _TodoimportanceEnumValueMap,
    ),
    r'ownerExternalId': PropertySchema(
      id: 9,
      name: r'ownerExternalId',
      type: IsarType.string,
    ),
    r'parentExternalId': PropertySchema(
      id: 10,
      name: r'parentExternalId',
      type: IsarType.string,
    ),
    r'sourceType': PropertySchema(
      id: 11,
      name: r'sourceType',
      type: IsarType.string,
      enumMap: _TodosourceTypeEnumValueMap,
    ),
    r'startDate': PropertySchema(
      id: 12,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.string,
      enumMap: _TodostatusEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 14,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _todoEstimateSize,
  serialize: _todoSerialize,
  deserialize: _todoDeserialize,
  deserializeProp: _todoDeserializeProp,
  idName: r'id',
  indexes: {
    r'externalId': IndexSchema(
      id: 8629824136592255998,
      name: r'externalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'externalId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'goal': LinkSchema(
      id: 4177236698085657764,
      name: r'goal',
      target: r'Goal',
      single: true,
    ),
    r'parent': LinkSchema(
      id: 1045762746388937692,
      name: r'parent',
      target: r'Todo',
      single: true,
    ),
    r'subTodos': LinkSchema(
      id: -2751133429357256564,
      name: r'subTodos',
      target: r'Todo',
      single: false,
      linkName: r'parent',
    ),
    r'workSessions': LinkSchema(
      id: 873046715424299146,
      name: r'workSessions',
      target: r'WorkSession',
      single: false,
      linkName: r'todo',
    ),
    r'tags': LinkSchema(
      id: 3056408012929259026,
      name: r'tags',
      target: r'Tag',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _todoGetId,
  getLinks: _todoGetLinks,
  attach: _todoAttach,
  version: '3.1.0+1',
);

int _todoEstimateSize(
  Todo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assigneeExternalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.externalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.externalSourceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.goalExternalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.importance.name.length * 3;
  bytesCount += 3 + object.ownerExternalId.length * 3;
  {
    final value = object.parentExternalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sourceType.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _todoSerialize(
  Todo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assigneeExternalId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.dueDate);
  writer.writeLong(offsets[4], object.estimatedDuration);
  writer.writeString(offsets[5], object.externalId);
  writer.writeString(offsets[6], object.externalSourceId);
  writer.writeString(offsets[7], object.goalExternalId);
  writer.writeString(offsets[8], object.importance.name);
  writer.writeString(offsets[9], object.ownerExternalId);
  writer.writeString(offsets[10], object.parentExternalId);
  writer.writeString(offsets[11], object.sourceType.name);
  writer.writeDateTime(offsets[12], object.startDate);
  writer.writeString(offsets[13], object.status.name);
  writer.writeString(offsets[14], object.title);
  writer.writeDateTime(offsets[15], object.updatedAt);
}

Todo _todoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Todo();
  object.assigneeExternalId = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.dueDate = reader.readDateTimeOrNull(offsets[3]);
  object.estimatedDuration = reader.readLong(offsets[4]);
  object.externalId = reader.readStringOrNull(offsets[5]);
  object.externalSourceId = reader.readStringOrNull(offsets[6]);
  object.goalExternalId = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.importance =
      _TodoimportanceValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          TodoImportance.critical;
  object.ownerExternalId = reader.readString(offsets[9]);
  object.parentExternalId = reader.readStringOrNull(offsets[10]);
  object.sourceType =
      _TodosourceTypeValueEnumMap[reader.readStringOrNull(offsets[11])] ??
          TodoSourceType.native;
  object.startDate = reader.readDateTimeOrNull(offsets[12]);
  object.status =
      _TodostatusValueEnumMap[reader.readStringOrNull(offsets[13])] ??
          TodoStatus.draft;
  object.title = reader.readString(offsets[14]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[15]);
  return object;
}

P _todoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (_TodoimportanceValueEnumMap[reader.readStringOrNull(offset)] ??
          TodoImportance.critical) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (_TodosourceTypeValueEnumMap[reader.readStringOrNull(offset)] ??
          TodoSourceType.native) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (_TodostatusValueEnumMap[reader.readStringOrNull(offset)] ??
          TodoStatus.draft) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TodoimportanceEnumValueMap = {
  r'critical': r'critical',
  r'high': r'high',
  r'medium': r'medium',
  r'low': r'low',
};
const _TodoimportanceValueEnumMap = {
  r'critical': TodoImportance.critical,
  r'high': TodoImportance.high,
  r'medium': TodoImportance.medium,
  r'low': TodoImportance.low,
};
const _TodosourceTypeEnumValueMap = {
  r'native': r'native',
  r'github': r'github',
  r'msTodo': r'msTodo',
};
const _TodosourceTypeValueEnumMap = {
  r'native': TodoSourceType.native,
  r'github': TodoSourceType.github,
  r'msTodo': TodoSourceType.msTodo,
};
const _TodostatusEnumValueMap = {
  r'draft': r'draft',
  r'inProgress': r'inProgress',
  r'waiting': r'waiting',
  r'completed': r'completed',
};
const _TodostatusValueEnumMap = {
  r'draft': TodoStatus.draft,
  r'inProgress': TodoStatus.inProgress,
  r'waiting': TodoStatus.waiting,
  r'completed': TodoStatus.completed,
};

Id _todoGetId(Todo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _todoGetLinks(Todo object) {
  return [
    object.goal,
    object.parent,
    object.subTodos,
    object.workSessions,
    object.tags
  ];
}

void _todoAttach(IsarCollection<dynamic> col, Id id, Todo object) {
  object.id = id;
  object.goal.attach(col, col.isar.collection<Goal>(), r'goal', id);
  object.parent.attach(col, col.isar.collection<Todo>(), r'parent', id);
  object.subTodos.attach(col, col.isar.collection<Todo>(), r'subTodos', id);
  object.workSessions
      .attach(col, col.isar.collection<WorkSession>(), r'workSessions', id);
  object.tags.attach(col, col.isar.collection<Tag>(), r'tags', id);
}

extension TodoByIndex on IsarCollection<Todo> {
  Future<Todo?> getByExternalId(String? externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  Todo? getByExternalIdSync(String? externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(String? externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(String? externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<Todo?>> getAllByExternalId(List<String?> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<Todo?> getAllByExternalIdSync(List<String?> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'externalId', values);
  }

  Future<int> deleteAllByExternalId(List<String?> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'externalId', values);
  }

  int deleteAllByExternalIdSync(List<String?> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'externalId', values);
  }

  Future<Id> putByExternalId(Todo object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(Todo object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<Todo> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<Todo> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension TodoQueryWhereSort on QueryBuilder<Todo, Todo, QWhere> {
  QueryBuilder<Todo, Todo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TodoQueryWhere on QueryBuilder<Todo, Todo, QWhereClause> {
  QueryBuilder<Todo, Todo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> externalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> externalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'externalId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> externalIdEqualTo(
      String? externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> externalIdNotEqualTo(
      String? externalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [],
              upper: [externalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [externalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [externalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'externalId',
              lower: [],
              upper: [externalId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TodoQueryFilter on QueryBuilder<Todo, Todo, QFilterCondition> {
  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assigneeExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition>
      assigneeExternalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assigneeExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assigneeExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assigneeExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assigneeExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> assigneeExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigneeExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition>
      assigneeExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assigneeExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> estimatedDurationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> estimatedDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> estimatedDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> estimatedDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'externalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'externalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'externalSourceId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'externalSourceId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalSourceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalSourceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalSourceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalSourceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> externalSourceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalSourceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'goalExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'goalExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goalExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'goalExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'goalExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goalExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'goalExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceEqualTo(
    TodoImportance value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceGreaterThan(
    TodoImportance value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceLessThan(
    TodoImportance value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceBetween(
    TodoImportance lower,
    TodoImportance upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'importance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'importance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importance',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> importanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'importance',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> ownerExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentExternalId',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeEqualTo(
    TodoSourceType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeGreaterThan(
    TodoSourceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeLessThan(
    TodoSourceType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeBetween(
    TodoSourceType lower,
    TodoSourceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> sourceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceType',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusEqualTo(
    TodoStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusGreaterThan(
    TodoStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusLessThan(
    TodoStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusBetween(
    TodoStatus lower,
    TodoStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodoQueryObject on QueryBuilder<Todo, Todo, QFilterCondition> {}

extension TodoQueryLinks on QueryBuilder<Todo, Todo, QFilterCondition> {
  QueryBuilder<Todo, Todo, QAfterFilterCondition> goal(FilterQuery<Goal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'goal');
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> goalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goal', 0, true, 0, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parent(FilterQuery<Todo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'parent');
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> parentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'parent', 0, true, 0, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodos(
      FilterQuery<Todo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'subTodos');
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subTodos', length, true, length, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subTodos', 0, true, 0, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subTodos', 0, false, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subTodos', 0, true, length, include);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'subTodos', length, include, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> subTodosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'subTodos', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessions(
      FilterQuery<WorkSession> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'workSessions');
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workSessions', length, true, length, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workSessions', 0, true, 0, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workSessions', 0, false, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workSessions', 0, true, length, include);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'workSessions', length, include, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> workSessionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'workSessions', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tags(FilterQuery<Tag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tags');
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tags', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TodoQuerySortBy on QueryBuilder<Todo, Todo, QSortBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> sortByAssigneeExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigneeExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByAssigneeExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigneeExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByEstimatedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByExternalSourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalSourceId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByExternalSourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalSourceId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByGoalExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByGoalExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByOwnerExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByOwnerExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByParentExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByParentExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TodoQuerySortThenBy on QueryBuilder<Todo, Todo, QSortThenBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> thenByAssigneeExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigneeExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByAssigneeExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigneeExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByEstimatedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDuration', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByExternalSourceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalSourceId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByExternalSourceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalSourceId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByGoalExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByGoalExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByImportance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByImportanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importance', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByOwnerExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByOwnerExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByParentExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentExternalId', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByParentExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentExternalId', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenBySourceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenBySourceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceType', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TodoQueryWhereDistinct on QueryBuilder<Todo, Todo, QDistinct> {
  QueryBuilder<Todo, Todo, QDistinct> distinctByAssigneeExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assigneeExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByEstimatedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDuration');
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByExternalSourceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalSourceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByGoalExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goalExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByImportance(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importance', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByOwnerExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByParentExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctBySourceType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TodoQueryProperty on QueryBuilder<Todo, Todo, QQueryProperty> {
  QueryBuilder<Todo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> assigneeExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assigneeExternalId');
    });
  }

  QueryBuilder<Todo, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Todo, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<Todo, int, QQueryOperations> estimatedDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDuration');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> externalSourceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalSourceId');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> goalExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goalExternalId');
    });
  }

  QueryBuilder<Todo, TodoImportance, QQueryOperations> importanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importance');
    });
  }

  QueryBuilder<Todo, String, QQueryOperations> ownerExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerExternalId');
    });
  }

  QueryBuilder<Todo, String?, QQueryOperations> parentExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentExternalId');
    });
  }

  QueryBuilder<Todo, TodoSourceType, QQueryOperations> sourceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceType');
    });
  }

  QueryBuilder<Todo, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<Todo, TodoStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Todo, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Todo, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
