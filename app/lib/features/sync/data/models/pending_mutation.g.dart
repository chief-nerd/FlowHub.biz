// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_mutation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPendingMutationCollection on Isar {
  IsarCollection<PendingMutation> get pendingMutations => this.collection();
}

const PendingMutationSchema = CollectionSchema(
  name: r'PendingMutation',
  id: -7381204330448478674,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'data': PropertySchema(
      id: 1,
      name: r'data',
      type: IsarType.string,
    ),
    r'entityExternalId': PropertySchema(
      id: 2,
      name: r'entityExternalId',
      type: IsarType.string,
    ),
    r'entityType': PropertySchema(
      id: 3,
      name: r'entityType',
      type: IsarType.string,
      enumMap: _PendingMutationentityTypeEnumValueMap,
    ),
    r'mutationType': PropertySchema(
      id: 4,
      name: r'mutationType',
      type: IsarType.string,
      enumMap: _PendingMutationmutationTypeEnumValueMap,
    )
  },
  estimateSize: _pendingMutationEstimateSize,
  serialize: _pendingMutationSerialize,
  deserialize: _pendingMutationDeserialize,
  deserializeProp: _pendingMutationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pendingMutationGetId,
  getLinks: _pendingMutationGetLinks,
  attach: _pendingMutationAttach,
  version: '3.1.0+1',
);

int _pendingMutationEstimateSize(
  PendingMutation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.data;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.entityExternalId.length * 3;
  bytesCount += 3 + object.entityType.name.length * 3;
  bytesCount += 3 + object.mutationType.name.length * 3;
  return bytesCount;
}

void _pendingMutationSerialize(
  PendingMutation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.data);
  writer.writeString(offsets[2], object.entityExternalId);
  writer.writeString(offsets[3], object.entityType.name);
  writer.writeString(offsets[4], object.mutationType.name);
}

PendingMutation _pendingMutationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PendingMutation();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.data = reader.readStringOrNull(offsets[1]);
  object.entityExternalId = reader.readString(offsets[2]);
  object.entityType = _PendingMutationentityTypeValueEnumMap[
          reader.readStringOrNull(offsets[3])] ??
      EntityType.goal;
  object.id = id;
  object.mutationType = _PendingMutationmutationTypeValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      MutationType.create;
  return object;
}

P _pendingMutationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_PendingMutationentityTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          EntityType.goal) as P;
    case 4:
      return (_PendingMutationmutationTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MutationType.create) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PendingMutationentityTypeEnumValueMap = {
  r'goal': r'goal',
  r'todo': r'todo',
  r'workSession': r'workSession',
};
const _PendingMutationentityTypeValueEnumMap = {
  r'goal': EntityType.goal,
  r'todo': EntityType.todo,
  r'workSession': EntityType.workSession,
};
const _PendingMutationmutationTypeEnumValueMap = {
  r'create': r'create',
  r'update': r'update',
  r'delete': r'delete',
};
const _PendingMutationmutationTypeValueEnumMap = {
  r'create': MutationType.create,
  r'update': MutationType.update,
  r'delete': MutationType.delete,
};

Id _pendingMutationGetId(PendingMutation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pendingMutationGetLinks(PendingMutation object) {
  return [];
}

void _pendingMutationAttach(
    IsarCollection<dynamic> col, Id id, PendingMutation object) {
  object.id = id;
}

extension PendingMutationQueryWhereSort
    on QueryBuilder<PendingMutation, PendingMutation, QWhere> {
  QueryBuilder<PendingMutation, PendingMutation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PendingMutationQueryWhere
    on QueryBuilder<PendingMutation, PendingMutation, QWhereClause> {
  QueryBuilder<PendingMutation, PendingMutation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterWhereClause> idBetween(
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
}

extension PendingMutationQueryFilter
    on QueryBuilder<PendingMutation, PendingMutation, QFilterCondition> {
  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'data',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      dataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'data',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityExternalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityExternalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityExternalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityExternalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityExternalId',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeEqualTo(
    EntityType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeGreaterThan(
    EntityType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeLessThan(
    EntityType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeBetween(
    EntityType lower,
    EntityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeEqualTo(
    MutationType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeGreaterThan(
    MutationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeLessThan(
    MutationType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeBetween(
    MutationType lower,
    MutationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mutationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mutationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mutationType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mutationType',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterFilterCondition>
      mutationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mutationType',
        value: '',
      ));
    });
  }
}

extension PendingMutationQueryObject
    on QueryBuilder<PendingMutation, PendingMutation, QFilterCondition> {}

extension PendingMutationQueryLinks
    on QueryBuilder<PendingMutation, PendingMutation, QFilterCondition> {}

extension PendingMutationQuerySortBy
    on QueryBuilder<PendingMutation, PendingMutation, QSortBy> {
  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy> sortByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByEntityExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityExternalId', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByEntityExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityExternalId', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      sortByMutationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.desc);
    });
  }
}

extension PendingMutationQuerySortThenBy
    on QueryBuilder<PendingMutation, PendingMutation, QSortThenBy> {
  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy> thenByData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'data', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByEntityExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityExternalId', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByEntityExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityExternalId', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByMutationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.asc);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QAfterSortBy>
      thenByMutationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mutationType', Sort.desc);
    });
  }
}

extension PendingMutationQueryWhereDistinct
    on QueryBuilder<PendingMutation, PendingMutation, QDistinct> {
  QueryBuilder<PendingMutation, PendingMutation, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QDistinct> distinctByData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'data', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QDistinct>
      distinctByEntityExternalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityExternalId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QDistinct>
      distinctByEntityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PendingMutation, PendingMutation, QDistinct>
      distinctByMutationType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mutationType', caseSensitive: caseSensitive);
    });
  }
}

extension PendingMutationQueryProperty
    on QueryBuilder<PendingMutation, PendingMutation, QQueryProperty> {
  QueryBuilder<PendingMutation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PendingMutation, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PendingMutation, String?, QQueryOperations> dataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'data');
    });
  }

  QueryBuilder<PendingMutation, String, QQueryOperations>
      entityExternalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityExternalId');
    });
  }

  QueryBuilder<PendingMutation, EntityType, QQueryOperations>
      entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<PendingMutation, MutationType, QQueryOperations>
      mutationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mutationType');
    });
  }
}
