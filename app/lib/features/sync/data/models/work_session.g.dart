// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_session.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkSessionCollection on Isar {
  IsarCollection<WorkSession> get workSessions => this.collection();
}

const WorkSessionSchema = CollectionSchema(
  name: r'WorkSession',
  id: -4393819405090026064,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'externalId': PropertySchema(
      id: 2,
      name: r'externalId',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 3,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.string,
      enumMap: _WorkSessionstatusEnumValueMap,
    ),
    r'todoExternalId': PropertySchema(
      id: 5,
      name: r'todoExternalId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _workSessionEstimateSize,
  serialize: _workSessionSerialize,
  deserialize: _workSessionDeserialize,
  deserializeProp: _workSessionDeserializeProp,
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
    r'todo': LinkSchema(
      id: -4676273746092500868,
      name: r'todo',
      target: r'Todo',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _workSessionGetId,
  getLinks: _workSessionGetLinks,
  attach: _workSessionAttach,
  version: '3.1.0+1',
);

int _workSessionEstimateSize(
  WorkSession object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.externalId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.todoExternalId.length * 3;
  return bytesCount;
}

void _workSessionSerialize(
  WorkSession object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.endTime);
  writer.writeString(offsets[2], object.externalId);
  writer.writeDateTime(offsets[3], object.startTime);
  writer.writeString(offsets[4], object.status.name);
  writer.writeString(offsets[5], object.todoExternalId);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

WorkSession _workSessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkSession();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.endTime = reader.readDateTime(offsets[1]);
  object.externalId = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.startTime = reader.readDateTime(offsets[3]);
  object.status =
      _WorkSessionstatusValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          WorkSessionStatus.scheduled;
  object.todoExternalId = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[6]);
  return object;
}

P _workSessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (_WorkSessionstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          WorkSessionStatus.scheduled) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WorkSessionstatusEnumValueMap = {
  r'scheduled': r'scheduled',
  r'logged': r'logged',
  r'ghost': r'ghost',
};
const _WorkSessionstatusValueEnumMap = {
  r'scheduled': WorkSessionStatus.scheduled,
  r'logged': WorkSessionStatus.logged,
  r'ghost': WorkSessionStatus.ghost,
};

Id _workSessionGetId(WorkSession object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workSessionGetLinks(WorkSession object) {
  return [object.todo];
}

void _workSessionAttach(
    IsarCollection<dynamic> col, Id id, WorkSession object) {
  object.id = id;
  object.todo.attach(col, col.isar.collection<Todo>(), r'todo', id);
}

extension WorkSessionByIndex on IsarCollection<WorkSession> {
  Future<WorkSession?> getByExternalId(String? externalId) {
    return getByIndex(r'externalId', [externalId]);
  }

  WorkSession? getByExternalIdSync(String? externalId) {
    return getByIndexSync(r'externalId', [externalId]);
  }

  Future<bool> deleteByExternalId(String? externalId) {
    return deleteByIndex(r'externalId', [externalId]);
  }

  bool deleteByExternalIdSync(String? externalId) {
    return deleteByIndexSync(r'externalId', [externalId]);
  }

  Future<List<WorkSession?>> getAllByExternalId(
      List<String?> externalIdValues) {
    final values = externalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'externalId', values);
  }

  List<WorkSession?> getAllByExternalIdSync(List<String?> externalIdValues) {
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

  Future<Id> putByExternalId(WorkSession object) {
    return putByIndex(r'externalId', object);
  }

  Id putByExternalIdSync(WorkSession object, {bool saveLinks = true}) {
    return putByIndexSync(r'externalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByExternalId(List<WorkSession> objects) {
    return putAllByIndex(r'externalId', objects);
  }

  List<Id> putAllByExternalIdSync(List<WorkSession> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'externalId', objects, saveLinks: saveLinks);
  }
}

extension WorkSessionQueryWhereSort
    on QueryBuilder<WorkSession, WorkSession, QWhere> {
  QueryBuilder<WorkSession, WorkSession, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkSessionQueryWhere
    on QueryBuilder<WorkSession, WorkSession, QWhereClause> {
  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> idBetween(
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

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> externalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [null],
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause>
      externalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'externalId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause> externalIdEqualTo(
      String? externalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'externalId',
        value: [externalId],
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterWhereClause>
      externalIdNotEqualTo(String? externalId) {
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

extension WorkSessionQueryFilter
    on QueryBuilder<WorkSession, WorkSession, QFilterCondition> {
  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> endTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'externalId',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'externalId',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdEqualTo(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdGreaterThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdLessThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdBetween(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdStartsWith(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdEndsWith(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      externalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusEqualTo(
    WorkSessionStatus value, {
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      statusGreaterThan(
    WorkSessionStatus value, {
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusLessThan(
    WorkSessionStatus value, {
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusBetween(
    WorkSessionStatus lower,
    WorkSessionStatus upper, {
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todoExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'todoExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'todoExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      todoExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'todoExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition>
      updatedAtBetween(
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

extension WorkSessionQueryObject
    on QueryBuilder<WorkSession, WorkSession, QFilterCondition> {}

extension WorkSessionQueryLinks
    on QueryBuilder<WorkSession, WorkSession, QFilterCondition> {
  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> todo(
      FilterQuery<Todo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'todo');
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterFilterCondition> todoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todo', 0, true, 0, true);
    });
  }
}

extension WorkSessionQuerySortBy
    on QueryBuilder<WorkSession, WorkSession, QSortBy> {
  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByTodoExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoExternalId', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy>
      sortByTodoExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoExternalId', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension WorkSessionQuerySortThenBy
    on QueryBuilder<WorkSession, WorkSession, QSortThenBy> {
  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByTodoExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoExternalId', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy>
      thenByTodoExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoExternalId', Sort.desc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension WorkSessionQueryWhereDistinct
    on QueryBuilder<WorkSession, WorkSession, QDistinct> {
  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByTodoExternalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkSession, WorkSession, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension WorkSessionQueryProperty
    on QueryBuilder<WorkSession, WorkSession, QQueryProperty> {
  QueryBuilder<WorkSession, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkSession, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WorkSession, DateTime, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<WorkSession, String?, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<WorkSession, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<WorkSession, WorkSessionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<WorkSession, String, QQueryOperations> todoExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoExternalId');
    });
  }

  QueryBuilder<WorkSession, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
