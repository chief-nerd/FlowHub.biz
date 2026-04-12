// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _timezoneMeta =
      const VerificationMeta('timezone');
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
      'timezone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('UTC'));
  @override
  List<GeneratedColumn> get $columns => [externalId, email, fullName, timezone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      timezone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timezone'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String externalId;
  final String email;
  final String fullName;
  final String timezone;
  const User(
      {required this.externalId,
      required this.email,
      required this.fullName,
      required this.timezone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    map['email'] = Variable<String>(email);
    map['full_name'] = Variable<String>(fullName);
    map['timezone'] = Variable<String>(timezone);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      externalId: Value(externalId),
      email: Value(email),
      fullName: Value(fullName),
      timezone: Value(timezone),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      externalId: serializer.fromJson<String>(json['externalId']),
      email: serializer.fromJson<String>(json['email']),
      fullName: serializer.fromJson<String>(json['fullName']),
      timezone: serializer.fromJson<String>(json['timezone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'email': serializer.toJson<String>(email),
      'fullName': serializer.toJson<String>(fullName),
      'timezone': serializer.toJson<String>(timezone),
    };
  }

  User copyWith(
          {String? externalId,
          String? email,
          String? fullName,
          String? timezone}) =>
      User(
        externalId: externalId ?? this.externalId,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        timezone: timezone ?? this.timezone,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
      email: data.email.present ? data.email.value : this.email,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('externalId: $externalId, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('timezone: $timezone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(externalId, email, fullName, timezone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.externalId == this.externalId &&
          other.email == this.email &&
          other.fullName == this.fullName &&
          other.timezone == this.timezone);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> externalId;
  final Value<String> email;
  final Value<String> fullName;
  final Value<String> timezone;
  final Value<int> rowid;
  const UsersCompanion({
    this.externalId = const Value.absent(),
    this.email = const Value.absent(),
    this.fullName = const Value.absent(),
    this.timezone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String externalId,
    required String email,
    required String fullName,
    this.timezone = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : externalId = Value(externalId),
        email = Value(email),
        fullName = Value(fullName);
  static Insertable<User> custom({
    Expression<String>? externalId,
    Expression<String>? email,
    Expression<String>? fullName,
    Expression<String>? timezone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (timezone != null) 'timezone': timezone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? externalId,
      Value<String>? email,
      Value<String>? fullName,
      Value<String>? timezone,
      Value<int>? rowid}) {
    return UsersCompanion(
      externalId: externalId ?? this.externalId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      timezone: timezone ?? this.timezone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('externalId: $externalId, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('timezone: $timezone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerExternalIdMeta =
      const VerificationMeta('ownerExternalId');
  @override
  late final GeneratedColumn<String> ownerExternalId = GeneratedColumn<String>(
      'owner_external_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (external_id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [externalId, ownerExternalId, title, description, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('owner_external_id')) {
      context.handle(
          _ownerExternalIdMeta,
          ownerExternalId.isAcceptableOrUnknown(
              data['owner_external_id']!, _ownerExternalIdMeta));
    } else if (isInserting) {
      context.missing(_ownerExternalIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id'])!,
      ownerExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}owner_external_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final String externalId;
  final String ownerExternalId;
  final String title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Goal(
      {required this.externalId,
      required this.ownerExternalId,
      required this.title,
      this.description,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    map['owner_external_id'] = Variable<String>(ownerExternalId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      externalId: Value(externalId),
      ownerExternalId: Value(ownerExternalId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      externalId: serializer.fromJson<String>(json['externalId']),
      ownerExternalId: serializer.fromJson<String>(json['ownerExternalId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'ownerExternalId': serializer.toJson<String>(ownerExternalId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Goal copyWith(
          {String? externalId,
          String? ownerExternalId,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Goal(
        externalId: externalId ?? this.externalId,
        ownerExternalId: ownerExternalId ?? this.ownerExternalId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
      ownerExternalId: data.ownerExternalId.present
          ? data.ownerExternalId.value
          : this.ownerExternalId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('externalId: $externalId, ')
          ..write('ownerExternalId: $ownerExternalId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      externalId, ownerExternalId, title, description, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.externalId == this.externalId &&
          other.ownerExternalId == this.ownerExternalId &&
          other.title == this.title &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<String> externalId;
  final Value<String> ownerExternalId;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.externalId = const Value.absent(),
    this.ownerExternalId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String externalId,
    required String ownerExternalId,
    required String title,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : externalId = Value(externalId),
        ownerExternalId = Value(ownerExternalId),
        title = Value(title);
  static Insertable<Goal> custom({
    Expression<String>? externalId,
    Expression<String>? ownerExternalId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (ownerExternalId != null) 'owner_external_id': ownerExternalId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? externalId,
      Value<String>? ownerExternalId,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return GoalsCompanion(
      externalId: externalId ?? this.externalId,
      ownerExternalId: ownerExternalId ?? this.ownerExternalId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (ownerExternalId.present) {
      map['owner_external_id'] = Variable<String>(ownerExternalId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('externalId: $externalId, ')
          ..write('ownerExternalId: $ownerExternalId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parentExternalIdMeta =
      const VerificationMeta('parentExternalId');
  @override
  late final GeneratedColumn<String> parentExternalId = GeneratedColumn<String>(
      'parent_external_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (external_id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [externalId, name, category, color, parentExternalId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('parent_external_id')) {
      context.handle(
          _parentExternalIdMeta,
          parentExternalId.isAcceptableOrUnknown(
              data['parent_external_id']!, _parentExternalIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      parentExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}parent_external_id']),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String externalId;
  final String name;
  final String? category;
  final String? color;
  final String? parentExternalId;
  const Tag(
      {required this.externalId,
      required this.name,
      this.category,
      this.color,
      this.parentExternalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || parentExternalId != null) {
      map['parent_external_id'] = Variable<String>(parentExternalId);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      externalId: Value(externalId),
      name: Value(name),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      parentExternalId: parentExternalId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentExternalId),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      externalId: serializer.fromJson<String>(json['externalId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String?>(json['category']),
      color: serializer.fromJson<String?>(json['color']),
      parentExternalId: serializer.fromJson<String?>(json['parentExternalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String?>(category),
      'color': serializer.toJson<String?>(color),
      'parentExternalId': serializer.toJson<String?>(parentExternalId),
    };
  }

  Tag copyWith(
          {String? externalId,
          String? name,
          Value<String?> category = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> parentExternalId = const Value.absent()}) =>
      Tag(
        externalId: externalId ?? this.externalId,
        name: name ?? this.name,
        category: category.present ? category.value : this.category,
        color: color.present ? color.value : this.color,
        parentExternalId: parentExternalId.present
            ? parentExternalId.value
            : this.parentExternalId,
      );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      color: data.color.present ? data.color.value : this.color,
      parentExternalId: data.parentExternalId.present
          ? data.parentExternalId.value
          : this.parentExternalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('externalId: $externalId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('parentExternalId: $parentExternalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(externalId, name, category, color, parentExternalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.externalId == this.externalId &&
          other.name == this.name &&
          other.category == this.category &&
          other.color == this.color &&
          other.parentExternalId == this.parentExternalId);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> externalId;
  final Value<String> name;
  final Value<String?> category;
  final Value<String?> color;
  final Value<String?> parentExternalId;
  final Value<int> rowid;
  const TagsCompanion({
    this.externalId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.color = const Value.absent(),
    this.parentExternalId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String externalId,
    required String name,
    this.category = const Value.absent(),
    this.color = const Value.absent(),
    this.parentExternalId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : externalId = Value(externalId),
        name = Value(name);
  static Insertable<Tag> custom({
    Expression<String>? externalId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? color,
    Expression<String>? parentExternalId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (color != null) 'color': color,
      if (parentExternalId != null) 'parent_external_id': parentExternalId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith(
      {Value<String>? externalId,
      Value<String>? name,
      Value<String?>? category,
      Value<String?>? color,
      Value<String?>? parentExternalId,
      Value<int>? rowid}) {
    return TagsCompanion(
      externalId: externalId ?? this.externalId,
      name: name ?? this.name,
      category: category ?? this.category,
      color: color ?? this.color,
      parentExternalId: parentExternalId ?? this.parentExternalId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (parentExternalId.present) {
      map['parent_external_id'] = Variable<String>(parentExternalId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('externalId: $externalId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('color: $color, ')
          ..write('parentExternalId: $parentExternalId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentExternalIdMeta =
      const VerificationMeta('parentExternalId');
  @override
  late final GeneratedColumn<String> parentExternalId = GeneratedColumn<String>(
      'parent_external_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (external_id)'));
  static const VerificationMeta _goalExternalIdMeta =
      const VerificationMeta('goalExternalId');
  @override
  late final GeneratedColumn<String> goalExternalId = GeneratedColumn<String>(
      'goal_external_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES goals (external_id)'));
  static const VerificationMeta _ownerExternalIdMeta =
      const VerificationMeta('ownerExternalId');
  @override
  late final GeneratedColumn<String> ownerExternalId = GeneratedColumn<String>(
      'owner_external_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (external_id)'));
  static const VerificationMeta _assigneeExternalIdMeta =
      const VerificationMeta('assigneeExternalId');
  @override
  late final GeneratedColumn<String> assigneeExternalId =
      GeneratedColumn<String>('assignee_external_id', aliasedName, true,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES users (external_id)'));
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumnWithTypeConverter<TodoSourceType, String>
      sourceType = GeneratedColumn<String>('source_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TodoSourceType>($TodosTable.$convertersourceType);
  static const VerificationMeta _externalSourceIdMeta =
      const VerificationMeta('externalSourceId');
  @override
  late final GeneratedColumn<String> externalSourceId = GeneratedColumn<String>(
      'external_source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<TodoStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TodoStatus>($TodosTable.$converterstatus);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumnWithTypeConverter<TodoImportance, String>
      importance = GeneratedColumn<String>('importance', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TodoImportance>($TodosTable.$converterimportance);
  static const VerificationMeta _estimatedDurationMeta =
      const VerificationMeta('estimatedDuration');
  @override
  late final GeneratedColumn<int> estimatedDuration = GeneratedColumn<int>(
      'estimated_duration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        externalId,
        parentExternalId,
        goalExternalId,
        ownerExternalId,
        assigneeExternalId,
        sourceType,
        externalSourceId,
        title,
        description,
        startDate,
        dueDate,
        status,
        importance,
        estimatedDuration,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('parent_external_id')) {
      context.handle(
          _parentExternalIdMeta,
          parentExternalId.isAcceptableOrUnknown(
              data['parent_external_id']!, _parentExternalIdMeta));
    }
    if (data.containsKey('goal_external_id')) {
      context.handle(
          _goalExternalIdMeta,
          goalExternalId.isAcceptableOrUnknown(
              data['goal_external_id']!, _goalExternalIdMeta));
    }
    if (data.containsKey('owner_external_id')) {
      context.handle(
          _ownerExternalIdMeta,
          ownerExternalId.isAcceptableOrUnknown(
              data['owner_external_id']!, _ownerExternalIdMeta));
    } else if (isInserting) {
      context.missing(_ownerExternalIdMeta);
    }
    if (data.containsKey('assignee_external_id')) {
      context.handle(
          _assigneeExternalIdMeta,
          assigneeExternalId.isAcceptableOrUnknown(
              data['assignee_external_id']!, _assigneeExternalIdMeta));
    }
    context.handle(_sourceTypeMeta, const VerificationResult.success());
    if (data.containsKey('external_source_id')) {
      context.handle(
          _externalSourceIdMeta,
          externalSourceId.isAcceptableOrUnknown(
              data['external_source_id']!, _externalSourceIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    context.handle(_importanceMeta, const VerificationResult.success());
    if (data.containsKey('estimated_duration')) {
      context.handle(
          _estimatedDurationMeta,
          estimatedDuration.isAcceptableOrUnknown(
              data['estimated_duration']!, _estimatedDurationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id'])!,
      parentExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}parent_external_id']),
      goalExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}goal_external_id']),
      ownerExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}owner_external_id'])!,
      assigneeExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}assignee_external_id']),
      sourceType: $TodosTable.$convertersourceType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!),
      externalSourceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_source_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      status: $TodosTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      importance: $TodosTable.$converterimportance.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}importance'])!),
      estimatedDuration: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}estimated_duration'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }

  static TypeConverter<TodoSourceType, String> $convertersourceType =
      const TodoSourceTypeConverter();
  static TypeConverter<TodoStatus, String> $converterstatus =
      const TodoStatusConverter();
  static TypeConverter<TodoImportance, String> $converterimportance =
      const TodoImportanceConverter();
}

class Todo extends DataClass implements Insertable<Todo> {
  final String externalId;
  final String? parentExternalId;
  final String? goalExternalId;
  final String ownerExternalId;
  final String? assigneeExternalId;
  final TodoSourceType sourceType;
  final String? externalSourceId;
  final String title;
  final String? description;
  final DateTime? startDate;
  final DateTime? dueDate;
  final TodoStatus status;
  final TodoImportance importance;
  final int estimatedDuration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Todo(
      {required this.externalId,
      this.parentExternalId,
      this.goalExternalId,
      required this.ownerExternalId,
      this.assigneeExternalId,
      required this.sourceType,
      this.externalSourceId,
      required this.title,
      this.description,
      this.startDate,
      this.dueDate,
      required this.status,
      required this.importance,
      required this.estimatedDuration,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    if (!nullToAbsent || parentExternalId != null) {
      map['parent_external_id'] = Variable<String>(parentExternalId);
    }
    if (!nullToAbsent || goalExternalId != null) {
      map['goal_external_id'] = Variable<String>(goalExternalId);
    }
    map['owner_external_id'] = Variable<String>(ownerExternalId);
    if (!nullToAbsent || assigneeExternalId != null) {
      map['assignee_external_id'] = Variable<String>(assigneeExternalId);
    }
    {
      map['source_type'] =
          Variable<String>($TodosTable.$convertersourceType.toSql(sourceType));
    }
    if (!nullToAbsent || externalSourceId != null) {
      map['external_source_id'] = Variable<String>(externalSourceId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    {
      map['status'] =
          Variable<String>($TodosTable.$converterstatus.toSql(status));
    }
    {
      map['importance'] =
          Variable<String>($TodosTable.$converterimportance.toSql(importance));
    }
    map['estimated_duration'] = Variable<int>(estimatedDuration);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      externalId: Value(externalId),
      parentExternalId: parentExternalId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentExternalId),
      goalExternalId: goalExternalId == null && nullToAbsent
          ? const Value.absent()
          : Value(goalExternalId),
      ownerExternalId: Value(ownerExternalId),
      assigneeExternalId: assigneeExternalId == null && nullToAbsent
          ? const Value.absent()
          : Value(assigneeExternalId),
      sourceType: Value(sourceType),
      externalSourceId: externalSourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(externalSourceId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      status: Value(status),
      importance: Value(importance),
      estimatedDuration: Value(estimatedDuration),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      externalId: serializer.fromJson<String>(json['externalId']),
      parentExternalId: serializer.fromJson<String?>(json['parentExternalId']),
      goalExternalId: serializer.fromJson<String?>(json['goalExternalId']),
      ownerExternalId: serializer.fromJson<String>(json['ownerExternalId']),
      assigneeExternalId:
          serializer.fromJson<String?>(json['assigneeExternalId']),
      sourceType: serializer.fromJson<TodoSourceType>(json['sourceType']),
      externalSourceId: serializer.fromJson<String?>(json['externalSourceId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      status: serializer.fromJson<TodoStatus>(json['status']),
      importance: serializer.fromJson<TodoImportance>(json['importance']),
      estimatedDuration: serializer.fromJson<int>(json['estimatedDuration']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'parentExternalId': serializer.toJson<String?>(parentExternalId),
      'goalExternalId': serializer.toJson<String?>(goalExternalId),
      'ownerExternalId': serializer.toJson<String>(ownerExternalId),
      'assigneeExternalId': serializer.toJson<String?>(assigneeExternalId),
      'sourceType': serializer.toJson<TodoSourceType>(sourceType),
      'externalSourceId': serializer.toJson<String?>(externalSourceId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'status': serializer.toJson<TodoStatus>(status),
      'importance': serializer.toJson<TodoImportance>(importance),
      'estimatedDuration': serializer.toJson<int>(estimatedDuration),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Todo copyWith(
          {String? externalId,
          Value<String?> parentExternalId = const Value.absent(),
          Value<String?> goalExternalId = const Value.absent(),
          String? ownerExternalId,
          Value<String?> assigneeExternalId = const Value.absent(),
          TodoSourceType? sourceType,
          Value<String?> externalSourceId = const Value.absent(),
          String? title,
          Value<String?> description = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> dueDate = const Value.absent(),
          TodoStatus? status,
          TodoImportance? importance,
          int? estimatedDuration,
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Todo(
        externalId: externalId ?? this.externalId,
        parentExternalId: parentExternalId.present
            ? parentExternalId.value
            : this.parentExternalId,
        goalExternalId:
            goalExternalId.present ? goalExternalId.value : this.goalExternalId,
        ownerExternalId: ownerExternalId ?? this.ownerExternalId,
        assigneeExternalId: assigneeExternalId.present
            ? assigneeExternalId.value
            : this.assigneeExternalId,
        sourceType: sourceType ?? this.sourceType,
        externalSourceId: externalSourceId.present
            ? externalSourceId.value
            : this.externalSourceId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        startDate: startDate.present ? startDate.value : this.startDate,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        status: status ?? this.status,
        importance: importance ?? this.importance,
        estimatedDuration: estimatedDuration ?? this.estimatedDuration,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  Todo copyWithCompanion(TodosCompanion data) {
    return Todo(
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
      parentExternalId: data.parentExternalId.present
          ? data.parentExternalId.value
          : this.parentExternalId,
      goalExternalId: data.goalExternalId.present
          ? data.goalExternalId.value
          : this.goalExternalId,
      ownerExternalId: data.ownerExternalId.present
          ? data.ownerExternalId.value
          : this.ownerExternalId,
      assigneeExternalId: data.assigneeExternalId.present
          ? data.assigneeExternalId.value
          : this.assigneeExternalId,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      externalSourceId: data.externalSourceId.present
          ? data.externalSourceId.value
          : this.externalSourceId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
      importance:
          data.importance.present ? data.importance.value : this.importance,
      estimatedDuration: data.estimatedDuration.present
          ? data.estimatedDuration.value
          : this.estimatedDuration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('externalId: $externalId, ')
          ..write('parentExternalId: $parentExternalId, ')
          ..write('goalExternalId: $goalExternalId, ')
          ..write('ownerExternalId: $ownerExternalId, ')
          ..write('assigneeExternalId: $assigneeExternalId, ')
          ..write('sourceType: $sourceType, ')
          ..write('externalSourceId: $externalSourceId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('importance: $importance, ')
          ..write('estimatedDuration: $estimatedDuration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      externalId,
      parentExternalId,
      goalExternalId,
      ownerExternalId,
      assigneeExternalId,
      sourceType,
      externalSourceId,
      title,
      description,
      startDate,
      dueDate,
      status,
      importance,
      estimatedDuration,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.externalId == this.externalId &&
          other.parentExternalId == this.parentExternalId &&
          other.goalExternalId == this.goalExternalId &&
          other.ownerExternalId == this.ownerExternalId &&
          other.assigneeExternalId == this.assigneeExternalId &&
          other.sourceType == this.sourceType &&
          other.externalSourceId == this.externalSourceId &&
          other.title == this.title &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.dueDate == this.dueDate &&
          other.status == this.status &&
          other.importance == this.importance &&
          other.estimatedDuration == this.estimatedDuration &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<String> externalId;
  final Value<String?> parentExternalId;
  final Value<String?> goalExternalId;
  final Value<String> ownerExternalId;
  final Value<String?> assigneeExternalId;
  final Value<TodoSourceType> sourceType;
  final Value<String?> externalSourceId;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime?> startDate;
  final Value<DateTime?> dueDate;
  final Value<TodoStatus> status;
  final Value<TodoImportance> importance;
  final Value<int> estimatedDuration;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const TodosCompanion({
    this.externalId = const Value.absent(),
    this.parentExternalId = const Value.absent(),
    this.goalExternalId = const Value.absent(),
    this.ownerExternalId = const Value.absent(),
    this.assigneeExternalId = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.externalSourceId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.importance = const Value.absent(),
    this.estimatedDuration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodosCompanion.insert({
    required String externalId,
    this.parentExternalId = const Value.absent(),
    this.goalExternalId = const Value.absent(),
    required String ownerExternalId,
    this.assigneeExternalId = const Value.absent(),
    required TodoSourceType sourceType,
    this.externalSourceId = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    required TodoStatus status,
    required TodoImportance importance,
    this.estimatedDuration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : externalId = Value(externalId),
        ownerExternalId = Value(ownerExternalId),
        sourceType = Value(sourceType),
        title = Value(title),
        status = Value(status),
        importance = Value(importance);
  static Insertable<Todo> custom({
    Expression<String>? externalId,
    Expression<String>? parentExternalId,
    Expression<String>? goalExternalId,
    Expression<String>? ownerExternalId,
    Expression<String>? assigneeExternalId,
    Expression<String>? sourceType,
    Expression<String>? externalSourceId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? startDate,
    Expression<DateTime>? dueDate,
    Expression<String>? status,
    Expression<String>? importance,
    Expression<int>? estimatedDuration,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (parentExternalId != null) 'parent_external_id': parentExternalId,
      if (goalExternalId != null) 'goal_external_id': goalExternalId,
      if (ownerExternalId != null) 'owner_external_id': ownerExternalId,
      if (assigneeExternalId != null)
        'assignee_external_id': assigneeExternalId,
      if (sourceType != null) 'source_type': sourceType,
      if (externalSourceId != null) 'external_source_id': externalSourceId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
      if (importance != null) 'importance': importance,
      if (estimatedDuration != null) 'estimated_duration': estimatedDuration,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodosCompanion copyWith(
      {Value<String>? externalId,
      Value<String?>? parentExternalId,
      Value<String?>? goalExternalId,
      Value<String>? ownerExternalId,
      Value<String?>? assigneeExternalId,
      Value<TodoSourceType>? sourceType,
      Value<String?>? externalSourceId,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime?>? startDate,
      Value<DateTime?>? dueDate,
      Value<TodoStatus>? status,
      Value<TodoImportance>? importance,
      Value<int>? estimatedDuration,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return TodosCompanion(
      externalId: externalId ?? this.externalId,
      parentExternalId: parentExternalId ?? this.parentExternalId,
      goalExternalId: goalExternalId ?? this.goalExternalId,
      ownerExternalId: ownerExternalId ?? this.ownerExternalId,
      assigneeExternalId: assigneeExternalId ?? this.assigneeExternalId,
      sourceType: sourceType ?? this.sourceType,
      externalSourceId: externalSourceId ?? this.externalSourceId,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      importance: importance ?? this.importance,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (parentExternalId.present) {
      map['parent_external_id'] = Variable<String>(parentExternalId.value);
    }
    if (goalExternalId.present) {
      map['goal_external_id'] = Variable<String>(goalExternalId.value);
    }
    if (ownerExternalId.present) {
      map['owner_external_id'] = Variable<String>(ownerExternalId.value);
    }
    if (assigneeExternalId.present) {
      map['assignee_external_id'] = Variable<String>(assigneeExternalId.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(
          $TodosTable.$convertersourceType.toSql(sourceType.value));
    }
    if (externalSourceId.present) {
      map['external_source_id'] = Variable<String>(externalSourceId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (status.present) {
      map['status'] =
          Variable<String>($TodosTable.$converterstatus.toSql(status.value));
    }
    if (importance.present) {
      map['importance'] = Variable<String>(
          $TodosTable.$converterimportance.toSql(importance.value));
    }
    if (estimatedDuration.present) {
      map['estimated_duration'] = Variable<int>(estimatedDuration.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('externalId: $externalId, ')
          ..write('parentExternalId: $parentExternalId, ')
          ..write('goalExternalId: $goalExternalId, ')
          ..write('ownerExternalId: $ownerExternalId, ')
          ..write('assigneeExternalId: $assigneeExternalId, ')
          ..write('sourceType: $sourceType, ')
          ..write('externalSourceId: $externalSourceId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('importance: $importance, ')
          ..write('estimatedDuration: $estimatedDuration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodoTagsTable extends TodoTags with TableInfo<$TodoTagsTable, TodoTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _todoExternalIdMeta =
      const VerificationMeta('todoExternalId');
  @override
  late final GeneratedColumn<String> todoExternalId = GeneratedColumn<String>(
      'todo_external_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (external_id)'));
  static const VerificationMeta _tagExternalIdMeta =
      const VerificationMeta('tagExternalId');
  @override
  late final GeneratedColumn<String> tagExternalId = GeneratedColumn<String>(
      'tag_external_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (external_id)'));
  @override
  List<GeneratedColumn> get $columns => [todoExternalId, tagExternalId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_tags';
  @override
  VerificationContext validateIntegrity(Insertable<TodoTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('todo_external_id')) {
      context.handle(
          _todoExternalIdMeta,
          todoExternalId.isAcceptableOrUnknown(
              data['todo_external_id']!, _todoExternalIdMeta));
    } else if (isInserting) {
      context.missing(_todoExternalIdMeta);
    }
    if (data.containsKey('tag_external_id')) {
      context.handle(
          _tagExternalIdMeta,
          tagExternalId.isAcceptableOrUnknown(
              data['tag_external_id']!, _tagExternalIdMeta));
    } else if (isInserting) {
      context.missing(_tagExternalIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {todoExternalId, tagExternalId};
  @override
  TodoTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoTag(
      todoExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}todo_external_id'])!,
      tagExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tag_external_id'])!,
    );
  }

  @override
  $TodoTagsTable createAlias(String alias) {
    return $TodoTagsTable(attachedDatabase, alias);
  }
}

class TodoTag extends DataClass implements Insertable<TodoTag> {
  final String todoExternalId;
  final String tagExternalId;
  const TodoTag({required this.todoExternalId, required this.tagExternalId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['todo_external_id'] = Variable<String>(todoExternalId);
    map['tag_external_id'] = Variable<String>(tagExternalId);
    return map;
  }

  TodoTagsCompanion toCompanion(bool nullToAbsent) {
    return TodoTagsCompanion(
      todoExternalId: Value(todoExternalId),
      tagExternalId: Value(tagExternalId),
    );
  }

  factory TodoTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoTag(
      todoExternalId: serializer.fromJson<String>(json['todoExternalId']),
      tagExternalId: serializer.fromJson<String>(json['tagExternalId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'todoExternalId': serializer.toJson<String>(todoExternalId),
      'tagExternalId': serializer.toJson<String>(tagExternalId),
    };
  }

  TodoTag copyWith({String? todoExternalId, String? tagExternalId}) => TodoTag(
        todoExternalId: todoExternalId ?? this.todoExternalId,
        tagExternalId: tagExternalId ?? this.tagExternalId,
      );
  TodoTag copyWithCompanion(TodoTagsCompanion data) {
    return TodoTag(
      todoExternalId: data.todoExternalId.present
          ? data.todoExternalId.value
          : this.todoExternalId,
      tagExternalId: data.tagExternalId.present
          ? data.tagExternalId.value
          : this.tagExternalId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoTag(')
          ..write('todoExternalId: $todoExternalId, ')
          ..write('tagExternalId: $tagExternalId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(todoExternalId, tagExternalId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoTag &&
          other.todoExternalId == this.todoExternalId &&
          other.tagExternalId == this.tagExternalId);
}

class TodoTagsCompanion extends UpdateCompanion<TodoTag> {
  final Value<String> todoExternalId;
  final Value<String> tagExternalId;
  final Value<int> rowid;
  const TodoTagsCompanion({
    this.todoExternalId = const Value.absent(),
    this.tagExternalId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoTagsCompanion.insert({
    required String todoExternalId,
    required String tagExternalId,
    this.rowid = const Value.absent(),
  })  : todoExternalId = Value(todoExternalId),
        tagExternalId = Value(tagExternalId);
  static Insertable<TodoTag> custom({
    Expression<String>? todoExternalId,
    Expression<String>? tagExternalId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (todoExternalId != null) 'todo_external_id': todoExternalId,
      if (tagExternalId != null) 'tag_external_id': tagExternalId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoTagsCompanion copyWith(
      {Value<String>? todoExternalId,
      Value<String>? tagExternalId,
      Value<int>? rowid}) {
    return TodoTagsCompanion(
      todoExternalId: todoExternalId ?? this.todoExternalId,
      tagExternalId: tagExternalId ?? this.tagExternalId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (todoExternalId.present) {
      map['todo_external_id'] = Variable<String>(todoExternalId.value);
    }
    if (tagExternalId.present) {
      map['tag_external_id'] = Variable<String>(tagExternalId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTagsCompanion(')
          ..write('todoExternalId: $todoExternalId, ')
          ..write('tagExternalId: $tagExternalId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkSessionsTable extends WorkSessions
    with TableInfo<$WorkSessionsTable, WorkSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _externalIdMeta =
      const VerificationMeta('externalId');
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
      'external_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _todoExternalIdMeta =
      const VerificationMeta('todoExternalId');
  @override
  late final GeneratedColumn<String> todoExternalId = GeneratedColumn<String>(
      'todo_external_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todos (external_id)'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<WorkSessionStatus, String>
      status = GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<WorkSessionStatus>(
              $WorkSessionsTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns =>
      [externalId, todoExternalId, startTime, endTime, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<WorkSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_id')) {
      context.handle(
          _externalIdMeta,
          externalId.isAcceptableOrUnknown(
              data['external_id']!, _externalIdMeta));
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('todo_external_id')) {
      context.handle(
          _todoExternalIdMeta,
          todoExternalId.isAcceptableOrUnknown(
              data['todo_external_id']!, _todoExternalIdMeta));
    } else if (isInserting) {
      context.missing(_todoExternalIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {externalId};
  @override
  WorkSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkSession(
      externalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}external_id'])!,
      todoExternalId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}todo_external_id'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      status: $WorkSessionsTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $WorkSessionsTable createAlias(String alias) {
    return $WorkSessionsTable(attachedDatabase, alias);
  }

  static TypeConverter<WorkSessionStatus, String> $converterstatus =
      const WorkSessionStatusConverter();
}

class WorkSession extends DataClass implements Insertable<WorkSession> {
  final String externalId;
  final String todoExternalId;
  final DateTime startTime;
  final DateTime endTime;
  final WorkSessionStatus status;
  const WorkSession(
      {required this.externalId,
      required this.todoExternalId,
      required this.startTime,
      required this.endTime,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_id'] = Variable<String>(externalId);
    map['todo_external_id'] = Variable<String>(todoExternalId);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    {
      map['status'] =
          Variable<String>($WorkSessionsTable.$converterstatus.toSql(status));
    }
    return map;
  }

  WorkSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkSessionsCompanion(
      externalId: Value(externalId),
      todoExternalId: Value(todoExternalId),
      startTime: Value(startTime),
      endTime: Value(endTime),
      status: Value(status),
    );
  }

  factory WorkSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkSession(
      externalId: serializer.fromJson<String>(json['externalId']),
      todoExternalId: serializer.fromJson<String>(json['todoExternalId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      status: serializer.fromJson<WorkSessionStatus>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'externalId': serializer.toJson<String>(externalId),
      'todoExternalId': serializer.toJson<String>(todoExternalId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'status': serializer.toJson<WorkSessionStatus>(status),
    };
  }

  WorkSession copyWith(
          {String? externalId,
          String? todoExternalId,
          DateTime? startTime,
          DateTime? endTime,
          WorkSessionStatus? status}) =>
      WorkSession(
        externalId: externalId ?? this.externalId,
        todoExternalId: todoExternalId ?? this.todoExternalId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        status: status ?? this.status,
      );
  WorkSession copyWithCompanion(WorkSessionsCompanion data) {
    return WorkSession(
      externalId:
          data.externalId.present ? data.externalId.value : this.externalId,
      todoExternalId: data.todoExternalId.present
          ? data.todoExternalId.value
          : this.todoExternalId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkSession(')
          ..write('externalId: $externalId, ')
          ..write('todoExternalId: $todoExternalId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(externalId, todoExternalId, startTime, endTime, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkSession &&
          other.externalId == this.externalId &&
          other.todoExternalId == this.todoExternalId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status);
}

class WorkSessionsCompanion extends UpdateCompanion<WorkSession> {
  final Value<String> externalId;
  final Value<String> todoExternalId;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<WorkSessionStatus> status;
  final Value<int> rowid;
  const WorkSessionsCompanion({
    this.externalId = const Value.absent(),
    this.todoExternalId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkSessionsCompanion.insert({
    required String externalId,
    required String todoExternalId,
    required DateTime startTime,
    required DateTime endTime,
    required WorkSessionStatus status,
    this.rowid = const Value.absent(),
  })  : externalId = Value(externalId),
        todoExternalId = Value(todoExternalId),
        startTime = Value(startTime),
        endTime = Value(endTime),
        status = Value(status);
  static Insertable<WorkSession> custom({
    Expression<String>? externalId,
    Expression<String>? todoExternalId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (externalId != null) 'external_id': externalId,
      if (todoExternalId != null) 'todo_external_id': todoExternalId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkSessionsCompanion copyWith(
      {Value<String>? externalId,
      Value<String>? todoExternalId,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime,
      Value<WorkSessionStatus>? status,
      Value<int>? rowid}) {
    return WorkSessionsCompanion(
      externalId: externalId ?? this.externalId,
      todoExternalId: todoExternalId ?? this.todoExternalId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (todoExternalId.present) {
      map['todo_external_id'] = Variable<String>(todoExternalId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $WorkSessionsTable.$converterstatus.toSql(status.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkSessionsCompanion(')
          ..write('externalId: $externalId, ')
          ..write('todoExternalId: $todoExternalId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $TodosTable todos = $TodosTable(this);
  late final $TodoTagsTable todoTags = $TodoTagsTable(this);
  late final $WorkSessionsTable workSessions = $WorkSessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, goals, tags, todos, todoTags, workSessions];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String externalId,
  required String email,
  required String fullName,
  Value<String> timezone,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> externalId,
  Value<String> email,
  Value<String> fullName,
  Value<String> timezone,
  Value<int> rowid,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.goals,
          aliasName: $_aliasNameGenerator(
              db.users.externalId, db.goals.ownerExternalId));

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.ownerExternalId.externalId($_item.externalId));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnFilters(column));

  Expression<bool> goalsRefs(
      Expression<bool> Function($$GoalsTableFilterComposer f) f) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.ownerExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableFilterComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  Expression<T> goalsRefs<T extends Object>(
      Expression<T> Function($$GoalsTableAnnotationComposer a) f) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.ownerExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableAnnotationComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool goalsRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> externalId = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> timezone = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            externalId: externalId,
            email: email,
            fullName: fullName,
            timezone: timezone,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String externalId,
            required String email,
            required String fullName,
            Value<String> timezone = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            externalId: externalId,
            email: email,
            fullName: fullName,
            timezone: timezone,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({goalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalsRefs) db.goals],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._goalsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).goalsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerExternalId == item.externalId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool goalsRefs})>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String externalId,
  required String ownerExternalId,
  required String title,
  Value<String?> description,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> externalId,
  Value<String> ownerExternalId,
  Value<String> title,
  Value<String?> description,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerExternalIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.goals.ownerExternalId, db.users.externalId));

  $$UsersTableProcessedTableManager get ownerExternalId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.externalId($_item.ownerExternalId));
    final item = $_typedResult.readTableOrNull(_ownerExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TodosTable, List<Todo>> _todosRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.todos,
          aliasName: $_aliasNameGenerator(
              db.goals.externalId, db.todos.goalExternalId));

  $$TodosTableProcessedTableManager get todosRefs {
    final manager = $$TodosTableTableManager($_db, $_db.todos)
        .filter((f) => f.goalExternalId.externalId($_item.externalId));

    final cache = $_typedResult.readTableOrNull(_todosRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get ownerExternalId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> todosRefs(
      Expression<bool> Function($$TodosTableFilterComposer f) f) {
    final $$TodosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.goalExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableFilterComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get ownerExternalId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerExternalId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> todosRefs<T extends Object>(
      Expression<T> Function($$TodosTableAnnotationComposer a) f) {
    final $$TodosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.goalExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableAnnotationComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, $$GoalsTableReferences),
    Goal,
    PrefetchHooks Function({bool ownerExternalId, bool todosRefs})> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> externalId = const Value.absent(),
            Value<String> ownerExternalId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            externalId: externalId,
            ownerExternalId: ownerExternalId,
            title: title,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String externalId,
            required String ownerExternalId,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            externalId: externalId,
            ownerExternalId: ownerExternalId,
            title: title,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$GoalsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {ownerExternalId = false, todosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (todosRefs) db.todos],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (ownerExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ownerExternalId,
                    referencedTable:
                        $$GoalsTableReferences._ownerExternalIdTable(db),
                    referencedColumn: $$GoalsTableReferences
                        ._ownerExternalIdTable(db)
                        .externalId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (todosRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$GoalsTableReferences._todosRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GoalsTableReferences(db, table, p0).todosRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.goalExternalId == item.externalId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    Goal,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (Goal, $$GoalsTableReferences),
    Goal,
    PrefetchHooks Function({bool ownerExternalId, bool todosRefs})>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  required String externalId,
  required String name,
  Value<String?> category,
  Value<String?> color,
  Value<String?> parentExternalId,
  Value<int> rowid,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<String> externalId,
  Value<String> name,
  Value<String?> category,
  Value<String?> color,
  Value<String?> parentExternalId,
  Value<int> rowid,
});

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TagsTable _parentExternalIdTable(_$AppDatabase db) =>
      db.tags.createAlias(
          $_aliasNameGenerator(db.tags.parentExternalId, db.tags.externalId));

  $$TagsTableProcessedTableManager? get parentExternalId {
    if ($_item.parentExternalId == null) return null;
    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.externalId($_item.parentExternalId!));
    final item = $_typedResult.readTableOrNull(_parentExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TodoTagsTable, List<TodoTag>> _todoTagsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.todoTags,
          aliasName: $_aliasNameGenerator(
              db.tags.externalId, db.todoTags.tagExternalId));

  $$TodoTagsTableProcessedTableManager get todoTagsRefs {
    final manager = $$TodoTagsTableTableManager($_db, $_db.todoTags)
        .filter((f) => f.tagExternalId.externalId($_item.externalId));

    final cache = $_typedResult.readTableOrNull(_todoTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  $$TagsTableFilterComposer get parentExternalId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> todoTagsRefs(
      Expression<bool> Function($$TodoTagsTableFilterComposer f) f) {
    final $$TodoTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todoTags,
        getReferencedColumn: (t) => t.tagExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoTagsTableFilterComposer(
              $db: $db,
              $table: $db.todoTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  $$TagsTableOrderingComposer get parentExternalId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  $$TagsTableAnnotationComposer get parentExternalId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> todoTagsRefs<T extends Object>(
      Expression<T> Function($$TodoTagsTableAnnotationComposer a) f) {
    final $$TodoTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todoTags,
        getReferencedColumn: (t) => t.tagExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.todoTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool parentExternalId, bool todoTagsRefs})> {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> externalId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> parentExternalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsCompanion(
            externalId: externalId,
            name: name,
            category: category,
            color: color,
            parentExternalId: parentExternalId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String externalId,
            required String name,
            Value<String?> category = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> parentExternalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsCompanion.insert(
            externalId: externalId,
            name: name,
            category: category,
            color: color,
            parentExternalId: parentExternalId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {parentExternalId = false, todoTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (todoTagsRefs) db.todoTags],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentExternalId,
                    referencedTable:
                        $$TagsTableReferences._parentExternalIdTable(db),
                    referencedColumn: $$TagsTableReferences
                        ._parentExternalIdTable(db)
                        .externalId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (todoTagsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TagsTableReferences._todoTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableReferences(db, table, p0).todoTagsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.tagExternalId == item.externalId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool parentExternalId, bool todoTagsRefs})>;
typedef $$TodosTableCreateCompanionBuilder = TodosCompanion Function({
  required String externalId,
  Value<String?> parentExternalId,
  Value<String?> goalExternalId,
  required String ownerExternalId,
  Value<String?> assigneeExternalId,
  required TodoSourceType sourceType,
  Value<String?> externalSourceId,
  required String title,
  Value<String?> description,
  Value<DateTime?> startDate,
  Value<DateTime?> dueDate,
  required TodoStatus status,
  required TodoImportance importance,
  Value<int> estimatedDuration,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$TodosTableUpdateCompanionBuilder = TodosCompanion Function({
  Value<String> externalId,
  Value<String?> parentExternalId,
  Value<String?> goalExternalId,
  Value<String> ownerExternalId,
  Value<String?> assigneeExternalId,
  Value<TodoSourceType> sourceType,
  Value<String?> externalSourceId,
  Value<String> title,
  Value<String?> description,
  Value<DateTime?> startDate,
  Value<DateTime?> dueDate,
  Value<TodoStatus> status,
  Value<TodoImportance> importance,
  Value<int> estimatedDuration,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

final class $$TodosTableReferences
    extends BaseReferences<_$AppDatabase, $TodosTable, Todo> {
  $$TodosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodosTable _parentExternalIdTable(_$AppDatabase db) =>
      db.todos.createAlias(
          $_aliasNameGenerator(db.todos.parentExternalId, db.todos.externalId));

  $$TodosTableProcessedTableManager? get parentExternalId {
    if ($_item.parentExternalId == null) return null;
    final manager = $$TodosTableTableManager($_db, $_db.todos)
        .filter((f) => f.externalId($_item.parentExternalId!));
    final item = $_typedResult.readTableOrNull(_parentExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GoalsTable _goalExternalIdTable(_$AppDatabase db) =>
      db.goals.createAlias(
          $_aliasNameGenerator(db.todos.goalExternalId, db.goals.externalId));

  $$GoalsTableProcessedTableManager? get goalExternalId {
    if ($_item.goalExternalId == null) return null;
    final manager = $$GoalsTableTableManager($_db, $_db.goals)
        .filter((f) => f.externalId($_item.goalExternalId!));
    final item = $_typedResult.readTableOrNull(_goalExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _ownerExternalIdTable(_$AppDatabase db) =>
      db.users.createAlias(
          $_aliasNameGenerator(db.todos.ownerExternalId, db.users.externalId));

  $$UsersTableProcessedTableManager get ownerExternalId {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.externalId($_item.ownerExternalId));
    final item = $_typedResult.readTableOrNull(_ownerExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _assigneeExternalIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(
          db.todos.assigneeExternalId, db.users.externalId));

  $$UsersTableProcessedTableManager? get assigneeExternalId {
    if ($_item.assigneeExternalId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.externalId($_item.assigneeExternalId!));
    final item = $_typedResult.readTableOrNull(_assigneeExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TodoTagsTable, List<TodoTag>> _todoTagsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.todoTags,
          aliasName: $_aliasNameGenerator(
              db.todos.externalId, db.todoTags.todoExternalId));

  $$TodoTagsTableProcessedTableManager get todoTagsRefs {
    final manager = $$TodoTagsTableTableManager($_db, $_db.todoTags)
        .filter((f) => f.todoExternalId.externalId($_item.externalId));

    final cache = $_typedResult.readTableOrNull(_todoTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WorkSessionsTable, List<WorkSession>>
      _workSessionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.workSessions,
              aliasName: $_aliasNameGenerator(
                  db.todos.externalId, db.workSessions.todoExternalId));

  $$WorkSessionsTableProcessedTableManager get workSessionsRefs {
    final manager = $$WorkSessionsTableTableManager($_db, $_db.workSessions)
        .filter((f) => f.todoExternalId.externalId($_item.externalId));

    final cache = $_typedResult.readTableOrNull(_workSessionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TodosTableFilterComposer extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TodoSourceType, TodoSourceType, String>
      get sourceType => $composableBuilder(
          column: $table.sourceType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get externalSourceId => $composableBuilder(
      column: $table.externalSourceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TodoStatus, TodoStatus, String> get status =>
      $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<TodoImportance, TodoImportance, String>
      get importance => $composableBuilder(
          column: $table.importance,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get estimatedDuration => $composableBuilder(
      column: $table.estimatedDuration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$TodosTableFilterComposer get parentExternalId {
    final $$TodosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableFilterComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GoalsTableFilterComposer get goalExternalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalExternalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableFilterComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get ownerExternalId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get assigneeExternalId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.assigneeExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> todoTagsRefs(
      Expression<bool> Function($$TodoTagsTableFilterComposer f) f) {
    final $$TodoTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todoTags,
        getReferencedColumn: (t) => t.todoExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoTagsTableFilterComposer(
              $db: $db,
              $table: $db.todoTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> workSessionsRefs(
      Expression<bool> Function($$WorkSessionsTableFilterComposer f) f) {
    final $$WorkSessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.workSessions,
        getReferencedColumn: (t) => t.todoExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkSessionsTableFilterComposer(
              $db: $db,
              $table: $db.workSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodosTableOrderingComposer
    extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get externalSourceId => $composableBuilder(
      column: $table.externalSourceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get importance => $composableBuilder(
      column: $table.importance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get estimatedDuration => $composableBuilder(
      column: $table.estimatedDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$TodosTableOrderingComposer get parentExternalId {
    final $$TodosTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableOrderingComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GoalsTableOrderingComposer get goalExternalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalExternalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableOrderingComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get ownerExternalId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get assigneeExternalId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.assigneeExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodosTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TodoSourceType, String> get sourceType =>
      $composableBuilder(
          column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get externalSourceId => $composableBuilder(
      column: $table.externalSourceId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TodoStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TodoImportance, String> get importance =>
      $composableBuilder(
          column: $table.importance, builder: (column) => column);

  GeneratedColumn<int> get estimatedDuration => $composableBuilder(
      column: $table.estimatedDuration, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TodosTableAnnotationComposer get parentExternalId {
    final $$TodosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableAnnotationComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GoalsTableAnnotationComposer get goalExternalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.goalExternalId,
        referencedTable: $db.goals,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GoalsTableAnnotationComposer(
              $db: $db,
              $table: $db.goals,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get ownerExternalId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ownerExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get assigneeExternalId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.assigneeExternalId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> todoTagsRefs<T extends Object>(
      Expression<T> Function($$TodoTagsTableAnnotationComposer a) f) {
    final $$TodoTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.todoTags,
        getReferencedColumn: (t) => t.todoExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.todoTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> workSessionsRefs<T extends Object>(
      Expression<T> Function($$WorkSessionsTableAnnotationComposer a) f) {
    final $$WorkSessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.externalId,
        referencedTable: $db.workSessions,
        getReferencedColumn: (t) => t.todoExternalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkSessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.workSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodosTable,
    Todo,
    $$TodosTableFilterComposer,
    $$TodosTableOrderingComposer,
    $$TodosTableAnnotationComposer,
    $$TodosTableCreateCompanionBuilder,
    $$TodosTableUpdateCompanionBuilder,
    (Todo, $$TodosTableReferences),
    Todo,
    PrefetchHooks Function(
        {bool parentExternalId,
        bool goalExternalId,
        bool ownerExternalId,
        bool assigneeExternalId,
        bool todoTagsRefs,
        bool workSessionsRefs})> {
  $$TodosTableTableManager(_$AppDatabase db, $TodosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> externalId = const Value.absent(),
            Value<String?> parentExternalId = const Value.absent(),
            Value<String?> goalExternalId = const Value.absent(),
            Value<String> ownerExternalId = const Value.absent(),
            Value<String?> assigneeExternalId = const Value.absent(),
            Value<TodoSourceType> sourceType = const Value.absent(),
            Value<String?> externalSourceId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<TodoStatus> status = const Value.absent(),
            Value<TodoImportance> importance = const Value.absent(),
            Value<int> estimatedDuration = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodosCompanion(
            externalId: externalId,
            parentExternalId: parentExternalId,
            goalExternalId: goalExternalId,
            ownerExternalId: ownerExternalId,
            assigneeExternalId: assigneeExternalId,
            sourceType: sourceType,
            externalSourceId: externalSourceId,
            title: title,
            description: description,
            startDate: startDate,
            dueDate: dueDate,
            status: status,
            importance: importance,
            estimatedDuration: estimatedDuration,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String externalId,
            Value<String?> parentExternalId = const Value.absent(),
            Value<String?> goalExternalId = const Value.absent(),
            required String ownerExternalId,
            Value<String?> assigneeExternalId = const Value.absent(),
            required TodoSourceType sourceType,
            Value<String?> externalSourceId = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            required TodoStatus status,
            required TodoImportance importance,
            Value<int> estimatedDuration = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodosCompanion.insert(
            externalId: externalId,
            parentExternalId: parentExternalId,
            goalExternalId: goalExternalId,
            ownerExternalId: ownerExternalId,
            assigneeExternalId: assigneeExternalId,
            sourceType: sourceType,
            externalSourceId: externalSourceId,
            title: title,
            description: description,
            startDate: startDate,
            dueDate: dueDate,
            status: status,
            importance: importance,
            estimatedDuration: estimatedDuration,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TodosTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {parentExternalId = false,
              goalExternalId = false,
              ownerExternalId = false,
              assigneeExternalId = false,
              todoTagsRefs = false,
              workSessionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (todoTagsRefs) db.todoTags,
                if (workSessionsRefs) db.workSessions
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentExternalId,
                    referencedTable:
                        $$TodosTableReferences._parentExternalIdTable(db),
                    referencedColumn: $$TodosTableReferences
                        ._parentExternalIdTable(db)
                        .externalId,
                  ) as T;
                }
                if (goalExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.goalExternalId,
                    referencedTable:
                        $$TodosTableReferences._goalExternalIdTable(db),
                    referencedColumn: $$TodosTableReferences
                        ._goalExternalIdTable(db)
                        .externalId,
                  ) as T;
                }
                if (ownerExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ownerExternalId,
                    referencedTable:
                        $$TodosTableReferences._ownerExternalIdTable(db),
                    referencedColumn: $$TodosTableReferences
                        ._ownerExternalIdTable(db)
                        .externalId,
                  ) as T;
                }
                if (assigneeExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.assigneeExternalId,
                    referencedTable:
                        $$TodosTableReferences._assigneeExternalIdTable(db),
                    referencedColumn: $$TodosTableReferences
                        ._assigneeExternalIdTable(db)
                        .externalId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (todoTagsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TodosTableReferences._todoTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TodosTableReferences(db, table, p0).todoTagsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.todoExternalId == item.externalId),
                        typedResults: items),
                  if (workSessionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TodosTableReferences._workSessionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TodosTableReferences(db, table, p0)
                                .workSessionsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.todoExternalId == item.externalId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TodosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodosTable,
    Todo,
    $$TodosTableFilterComposer,
    $$TodosTableOrderingComposer,
    $$TodosTableAnnotationComposer,
    $$TodosTableCreateCompanionBuilder,
    $$TodosTableUpdateCompanionBuilder,
    (Todo, $$TodosTableReferences),
    Todo,
    PrefetchHooks Function(
        {bool parentExternalId,
        bool goalExternalId,
        bool ownerExternalId,
        bool assigneeExternalId,
        bool todoTagsRefs,
        bool workSessionsRefs})>;
typedef $$TodoTagsTableCreateCompanionBuilder = TodoTagsCompanion Function({
  required String todoExternalId,
  required String tagExternalId,
  Value<int> rowid,
});
typedef $$TodoTagsTableUpdateCompanionBuilder = TodoTagsCompanion Function({
  Value<String> todoExternalId,
  Value<String> tagExternalId,
  Value<int> rowid,
});

final class $$TodoTagsTableReferences
    extends BaseReferences<_$AppDatabase, $TodoTagsTable, TodoTag> {
  $$TodoTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodosTable _todoExternalIdTable(_$AppDatabase db) =>
      db.todos.createAlias($_aliasNameGenerator(
          db.todoTags.todoExternalId, db.todos.externalId));

  $$TodosTableProcessedTableManager get todoExternalId {
    final manager = $$TodosTableTableManager($_db, $_db.todos)
        .filter((f) => f.externalId($_item.todoExternalId));
    final item = $_typedResult.readTableOrNull(_todoExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTable _tagExternalIdTable(_$AppDatabase db) =>
      db.tags.createAlias(
          $_aliasNameGenerator(db.todoTags.tagExternalId, db.tags.externalId));

  $$TagsTableProcessedTableManager get tagExternalId {
    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.externalId($_item.tagExternalId));
    final item = $_typedResult.readTableOrNull(_tagExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TodoTagsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoTagsTable> {
  $$TodoTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TodosTableFilterComposer get todoExternalId {
    final $$TodosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableFilterComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableFilterComposer get tagExternalId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoTagsTable> {
  $$TodoTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TodosTableOrderingComposer get todoExternalId {
    final $$TodosTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableOrderingComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableOrderingComposer get tagExternalId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoTagsTable> {
  $$TodoTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TodosTableAnnotationComposer get todoExternalId {
    final $$TodosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableAnnotationComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableAnnotationComposer get tagExternalId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagExternalId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoTagsTable,
    TodoTag,
    $$TodoTagsTableFilterComposer,
    $$TodoTagsTableOrderingComposer,
    $$TodoTagsTableAnnotationComposer,
    $$TodoTagsTableCreateCompanionBuilder,
    $$TodoTagsTableUpdateCompanionBuilder,
    (TodoTag, $$TodoTagsTableReferences),
    TodoTag,
    PrefetchHooks Function({bool todoExternalId, bool tagExternalId})> {
  $$TodoTagsTableTableManager(_$AppDatabase db, $TodoTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> todoExternalId = const Value.absent(),
            Value<String> tagExternalId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoTagsCompanion(
            todoExternalId: todoExternalId,
            tagExternalId: tagExternalId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String todoExternalId,
            required String tagExternalId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoTagsCompanion.insert(
            todoExternalId: todoExternalId,
            tagExternalId: tagExternalId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TodoTagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {todoExternalId = false, tagExternalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (todoExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.todoExternalId,
                    referencedTable:
                        $$TodoTagsTableReferences._todoExternalIdTable(db),
                    referencedColumn: $$TodoTagsTableReferences
                        ._todoExternalIdTable(db)
                        .externalId,
                  ) as T;
                }
                if (tagExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagExternalId,
                    referencedTable:
                        $$TodoTagsTableReferences._tagExternalIdTable(db),
                    referencedColumn: $$TodoTagsTableReferences
                        ._tagExternalIdTable(db)
                        .externalId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TodoTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodoTagsTable,
    TodoTag,
    $$TodoTagsTableFilterComposer,
    $$TodoTagsTableOrderingComposer,
    $$TodoTagsTableAnnotationComposer,
    $$TodoTagsTableCreateCompanionBuilder,
    $$TodoTagsTableUpdateCompanionBuilder,
    (TodoTag, $$TodoTagsTableReferences),
    TodoTag,
    PrefetchHooks Function({bool todoExternalId, bool tagExternalId})>;
typedef $$WorkSessionsTableCreateCompanionBuilder = WorkSessionsCompanion
    Function({
  required String externalId,
  required String todoExternalId,
  required DateTime startTime,
  required DateTime endTime,
  required WorkSessionStatus status,
  Value<int> rowid,
});
typedef $$WorkSessionsTableUpdateCompanionBuilder = WorkSessionsCompanion
    Function({
  Value<String> externalId,
  Value<String> todoExternalId,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
  Value<WorkSessionStatus> status,
  Value<int> rowid,
});

final class $$WorkSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $WorkSessionsTable, WorkSession> {
  $$WorkSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodosTable _todoExternalIdTable(_$AppDatabase db) =>
      db.todos.createAlias($_aliasNameGenerator(
          db.workSessions.todoExternalId, db.todos.externalId));

  $$TodosTableProcessedTableManager get todoExternalId {
    final manager = $$TodosTableTableManager($_db, $_db.todos)
        .filter((f) => f.externalId($_item.todoExternalId));
    final item = $_typedResult.readTableOrNull(_todoExternalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<WorkSessionStatus, WorkSessionStatus, String>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$TodosTableFilterComposer get todoExternalId {
    final $$TodosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableFilterComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$TodosTableOrderingComposer get todoExternalId {
    final $$TodosTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableOrderingComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkSessionsTable> {
  $$WorkSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get externalId => $composableBuilder(
      column: $table.externalId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WorkSessionStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$TodosTableAnnotationComposer get todoExternalId {
    final $$TodosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoExternalId,
        referencedTable: $db.todos,
        getReferencedColumn: (t) => t.externalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodosTableAnnotationComposer(
              $db: $db,
              $table: $db.todos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WorkSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkSessionsTable,
    WorkSession,
    $$WorkSessionsTableFilterComposer,
    $$WorkSessionsTableOrderingComposer,
    $$WorkSessionsTableAnnotationComposer,
    $$WorkSessionsTableCreateCompanionBuilder,
    $$WorkSessionsTableUpdateCompanionBuilder,
    (WorkSession, $$WorkSessionsTableReferences),
    WorkSession,
    PrefetchHooks Function({bool todoExternalId})> {
  $$WorkSessionsTableTableManager(_$AppDatabase db, $WorkSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> externalId = const Value.absent(),
            Value<String> todoExternalId = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
            Value<WorkSessionStatus> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkSessionsCompanion(
            externalId: externalId,
            todoExternalId: todoExternalId,
            startTime: startTime,
            endTime: endTime,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String externalId,
            required String todoExternalId,
            required DateTime startTime,
            required DateTime endTime,
            required WorkSessionStatus status,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkSessionsCompanion.insert(
            externalId: externalId,
            todoExternalId: todoExternalId,
            startTime: startTime,
            endTime: endTime,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkSessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({todoExternalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (todoExternalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.todoExternalId,
                    referencedTable:
                        $$WorkSessionsTableReferences._todoExternalIdTable(db),
                    referencedColumn: $$WorkSessionsTableReferences
                        ._todoExternalIdTable(db)
                        .externalId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkSessionsTable,
    WorkSession,
    $$WorkSessionsTableFilterComposer,
    $$WorkSessionsTableOrderingComposer,
    $$WorkSessionsTableAnnotationComposer,
    $$WorkSessionsTableCreateCompanionBuilder,
    $$WorkSessionsTableUpdateCompanionBuilder,
    (WorkSession, $$WorkSessionsTableReferences),
    WorkSession,
    PrefetchHooks Function({bool todoExternalId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$TodosTableTableManager get todos =>
      $$TodosTableTableManager(_db, _db.todos);
  $$TodoTagsTableTableManager get todoTags =>
      $$TodoTagsTableTableManager(_db, _db.todoTags);
  $$WorkSessionsTableTableManager get workSessions =>
      $$WorkSessionsTableTableManager(_db, _db.workSessions);
}
