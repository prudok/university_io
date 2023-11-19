// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_db.dart';

// ignore_for_file: type=lint
class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> starYear = GeneratedColumn<int>(
      'star_year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, starYear];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Group(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      starYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}star_year'])!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final int id;
  final String name;
  final int starYear;
  const Group({required this.id, required this.name, required this.starYear});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['star_year'] = Variable<int>(starYear);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      name: Value(name),
      starYear: Value(starYear),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      starYear: serializer.fromJson<int>(json['starYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'starYear': serializer.toJson<int>(starYear),
    };
  }

  Group copyWith({int? id, String? name, int? starYear}) => Group(
        id: id ?? this.id,
        name: name ?? this.name,
        starYear: starYear ?? this.starYear,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('starYear: $starYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, starYear);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.name == this.name &&
          other.starYear == this.starYear);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> starYear;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.starYear = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int starYear,
  })  : name = Value(name),
        starYear = Value(starYear);
  static Insertable<Group> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? starYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (starYear != null) 'star_year': starYear,
    });
  }

  GroupsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? starYear}) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      starYear: starYear ?? this.starYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (starYear.present) {
      map['star_year'] = Variable<int>(starYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('starYear: $starYear')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (id)'));
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, groupId, firstName, lastName, email, phoneNumber, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final int groupId;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? address;
  const Student(
      {required this.id,
      required this.groupId,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.phoneNumber,
      this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group_id'] = Variable<int>(groupId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      groupId: Value(groupId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<int>(json['groupId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<int>(groupId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'address': serializer.toJson<String?>(address),
    };
  }

  Student copyWith(
          {int? id,
          int? groupId,
          String? firstName,
          String? lastName,
          String? email,
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> address = const Value.absent()}) =>
      Student(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        address: address.present ? address.value : this.address,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, groupId, firstName, lastName, email, phoneNumber, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<int> groupId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String?> phoneNumber;
  final Value<String?> address;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required int groupId,
    required String firstName,
    required String lastName,
    required String email,
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
  })  : groupId = Value(groupId),
        firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<int>? groupId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? groupId,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? email,
      Value<String?>? phoneNumber,
      Value<String?>? address}) {
    return StudentsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String name;
  const Subject({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Subject copyWith({int? id, String? name}) => Subject(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject && other.id == this.id && other.name == this.name);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> name;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SubjectsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ExamsTable extends Exams with TableInfo<$ExamsTable, Exam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExamsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> examDate = GeneratedColumn<String>(
      'exam_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> examTime = GeneratedColumn<String>(
      'exam_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, examDate, examTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exams';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exam(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      examDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exam_date'])!,
      examTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exam_time'])!,
    );
  }

  @override
  $ExamsTable createAlias(String alias) {
    return $ExamsTable(attachedDatabase, alias);
  }
}

class Exam extends DataClass implements Insertable<Exam> {
  final int id;
  final String examDate;
  final String examTime;
  const Exam(
      {required this.id, required this.examDate, required this.examTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exam_date'] = Variable<String>(examDate);
    map['exam_time'] = Variable<String>(examTime);
    return map;
  }

  ExamsCompanion toCompanion(bool nullToAbsent) {
    return ExamsCompanion(
      id: Value(id),
      examDate: Value(examDate),
      examTime: Value(examTime),
    );
  }

  factory Exam.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exam(
      id: serializer.fromJson<int>(json['id']),
      examDate: serializer.fromJson<String>(json['examDate']),
      examTime: serializer.fromJson<String>(json['examTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'examDate': serializer.toJson<String>(examDate),
      'examTime': serializer.toJson<String>(examTime),
    };
  }

  Exam copyWith({int? id, String? examDate, String? examTime}) => Exam(
        id: id ?? this.id,
        examDate: examDate ?? this.examDate,
        examTime: examTime ?? this.examTime,
      );
  @override
  String toString() {
    return (StringBuffer('Exam(')
          ..write('id: $id, ')
          ..write('examDate: $examDate, ')
          ..write('examTime: $examTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, examDate, examTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exam &&
          other.id == this.id &&
          other.examDate == this.examDate &&
          other.examTime == this.examTime);
}

class ExamsCompanion extends UpdateCompanion<Exam> {
  final Value<int> id;
  final Value<String> examDate;
  final Value<String> examTime;
  const ExamsCompanion({
    this.id = const Value.absent(),
    this.examDate = const Value.absent(),
    this.examTime = const Value.absent(),
  });
  ExamsCompanion.insert({
    this.id = const Value.absent(),
    required String examDate,
    required String examTime,
  })  : examDate = Value(examDate),
        examTime = Value(examTime);
  static Insertable<Exam> custom({
    Expression<int>? id,
    Expression<String>? examDate,
    Expression<String>? examTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (examDate != null) 'exam_date': examDate,
      if (examTime != null) 'exam_time': examTime,
    });
  }

  ExamsCompanion copyWith(
      {Value<int>? id, Value<String>? examDate, Value<String>? examTime}) {
    return ExamsCompanion(
      id: id ?? this.id,
      examDate: examDate ?? this.examDate,
      examTime: examTime ?? this.examTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (examDate.present) {
      map['exam_date'] = Variable<String>(examDate.value);
    }
    if (examTime.present) {
      map['exam_time'] = Variable<String>(examTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExamsCompanion(')
          ..write('id: $id, ')
          ..write('examDate: $examDate, ')
          ..write('examTime: $examTime')
          ..write(')'))
        .toString();
  }
}

class $AccuracyTablesTable extends AccuracyTables
    with TableInfo<$AccuracyTablesTable, AccuracyTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccuracyTablesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES students (id)'));
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (id)'));
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES subjects (id)'));
  @override
  late final GeneratedColumn<int> examId = GeneratedColumn<int>(
      'exam_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES exams (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, studentId, groupId, subjectId, examId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accuracy_tables';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccuracyTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccuracyTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
      examId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exam_id'])!,
    );
  }

  @override
  $AccuracyTablesTable createAlias(String alias) {
    return $AccuracyTablesTable(attachedDatabase, alias);
  }
}

class AccuracyTable extends DataClass implements Insertable<AccuracyTable> {
  final int id;
  final int studentId;
  final int groupId;
  final int subjectId;
  final int examId;
  const AccuracyTable(
      {required this.id,
      required this.studentId,
      required this.groupId,
      required this.subjectId,
      required this.examId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['group_id'] = Variable<int>(groupId);
    map['subject_id'] = Variable<int>(subjectId);
    map['exam_id'] = Variable<int>(examId);
    return map;
  }

  AccuracyTablesCompanion toCompanion(bool nullToAbsent) {
    return AccuracyTablesCompanion(
      id: Value(id),
      studentId: Value(studentId),
      groupId: Value(groupId),
      subjectId: Value(subjectId),
      examId: Value(examId),
    );
  }

  factory AccuracyTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccuracyTable(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      groupId: serializer.fromJson<int>(json['groupId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      examId: serializer.fromJson<int>(json['examId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'groupId': serializer.toJson<int>(groupId),
      'subjectId': serializer.toJson<int>(subjectId),
      'examId': serializer.toJson<int>(examId),
    };
  }

  AccuracyTable copyWith(
          {int? id,
          int? studentId,
          int? groupId,
          int? subjectId,
          int? examId}) =>
      AccuracyTable(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        groupId: groupId ?? this.groupId,
        subjectId: subjectId ?? this.subjectId,
        examId: examId ?? this.examId,
      );
  @override
  String toString() {
    return (StringBuffer('AccuracyTable(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('groupId: $groupId, ')
          ..write('subjectId: $subjectId, ')
          ..write('examId: $examId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, studentId, groupId, subjectId, examId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccuracyTable &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.groupId == this.groupId &&
          other.subjectId == this.subjectId &&
          other.examId == this.examId);
}

class AccuracyTablesCompanion extends UpdateCompanion<AccuracyTable> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> groupId;
  final Value<int> subjectId;
  final Value<int> examId;
  const AccuracyTablesCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.examId = const Value.absent(),
  });
  AccuracyTablesCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int groupId,
    required int subjectId,
    required int examId,
  })  : studentId = Value(studentId),
        groupId = Value(groupId),
        subjectId = Value(subjectId),
        examId = Value(examId);
  static Insertable<AccuracyTable> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? groupId,
    Expression<int>? subjectId,
    Expression<int>? examId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (groupId != null) 'group_id': groupId,
      if (subjectId != null) 'subject_id': subjectId,
      if (examId != null) 'exam_id': examId,
    });
  }

  AccuracyTablesCompanion copyWith(
      {Value<int>? id,
      Value<int>? studentId,
      Value<int>? groupId,
      Value<int>? subjectId,
      Value<int>? examId}) {
    return AccuracyTablesCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      groupId: groupId ?? this.groupId,
      subjectId: subjectId ?? this.subjectId,
      examId: examId ?? this.examId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (examId.present) {
      map['exam_id'] = Variable<int>(examId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccuracyTablesCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('groupId: $groupId, ')
          ..write('subjectId: $subjectId, ')
          ..write('examId: $examId')
          ..write(')'))
        .toString();
  }
}

class $AlliancesTable extends Alliances
    with TableInfo<$AlliancesTable, Alliance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlliancesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alliances';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alliance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alliance(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $AlliancesTable createAlias(String alias) {
    return $AlliancesTable(attachedDatabase, alias);
  }
}

class Alliance extends DataClass implements Insertable<Alliance> {
  final int id;
  final String name;
  const Alliance({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  AlliancesCompanion toCompanion(bool nullToAbsent) {
    return AlliancesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Alliance.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alliance(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Alliance copyWith({int? id, String? name}) => Alliance(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Alliance(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alliance && other.id == this.id && other.name == this.name);
}

class AlliancesCompanion extends UpdateCompanion<Alliance> {
  final Value<int> id;
  final Value<String> name;
  const AlliancesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  AlliancesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Alliance> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  AlliancesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return AlliancesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlliancesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> publicationYear = GeneratedColumn<String>(
      'publication_year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, author, publicationYear];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      publicationYear: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}publication_year'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  final int id;
  final String title;
  final String author;
  final String publicationYear;
  const Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.publicationYear});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['author'] = Variable<String>(author);
    map['publication_year'] = Variable<String>(publicationYear);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      title: Value(title),
      author: Value(author),
      publicationYear: Value(publicationYear),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      publicationYear: serializer.fromJson<String>(json['publicationYear']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'publicationYear': serializer.toJson<String>(publicationYear),
    };
  }

  Book copyWith(
          {int? id, String? title, String? author, String? publicationYear}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        publicationYear: publicationYear ?? this.publicationYear,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publicationYear: $publicationYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, author, publicationYear);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.publicationYear == this.publicationYear);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> author;
  final Value<String> publicationYear;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.publicationYear = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String author,
    required String publicationYear,
  })  : title = Value(title),
        author = Value(author),
        publicationYear = Value(publicationYear);
  static Insertable<Book> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? author,
    Expression<String>? publicationYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (author != null) 'author': author,
      if (publicationYear != null) 'publication_year': publicationYear,
    });
  }

  BooksCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? author,
      Value<String>? publicationYear}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      publicationYear: publicationYear ?? this.publicationYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publicationYear.present) {
      map['publication_year'] = Variable<String>(publicationYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('publicationYear: $publicationYear')
          ..write(')'))
        .toString();
  }
}

class $ClassroomsTable extends Classrooms
    with TableInfo<$ClassroomsTable, Classroom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClassroomsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
      'building', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> roomNumber = GeneratedColumn<int>(
      'room_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
      'capacity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, building, roomNumber, capacity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classrooms';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Classroom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Classroom(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      building: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}building'])!,
      roomNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_number'])!,
      capacity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}capacity'])!,
    );
  }

  @override
  $ClassroomsTable createAlias(String alias) {
    return $ClassroomsTable(attachedDatabase, alias);
  }
}

class Classroom extends DataClass implements Insertable<Classroom> {
  final int id;
  final String building;
  final int roomNumber;
  final int capacity;
  const Classroom(
      {required this.id,
      required this.building,
      required this.roomNumber,
      required this.capacity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['building'] = Variable<String>(building);
    map['room_number'] = Variable<int>(roomNumber);
    map['capacity'] = Variable<int>(capacity);
    return map;
  }

  ClassroomsCompanion toCompanion(bool nullToAbsent) {
    return ClassroomsCompanion(
      id: Value(id),
      building: Value(building),
      roomNumber: Value(roomNumber),
      capacity: Value(capacity),
    );
  }

  factory Classroom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Classroom(
      id: serializer.fromJson<int>(json['id']),
      building: serializer.fromJson<String>(json['building']),
      roomNumber: serializer.fromJson<int>(json['roomNumber']),
      capacity: serializer.fromJson<int>(json['capacity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'building': serializer.toJson<String>(building),
      'roomNumber': serializer.toJson<int>(roomNumber),
      'capacity': serializer.toJson<int>(capacity),
    };
  }

  Classroom copyWith(
          {int? id, String? building, int? roomNumber, int? capacity}) =>
      Classroom(
        id: id ?? this.id,
        building: building ?? this.building,
        roomNumber: roomNumber ?? this.roomNumber,
        capacity: capacity ?? this.capacity,
      );
  @override
  String toString() {
    return (StringBuffer('Classroom(')
          ..write('id: $id, ')
          ..write('building: $building, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('capacity: $capacity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, building, roomNumber, capacity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Classroom &&
          other.id == this.id &&
          other.building == this.building &&
          other.roomNumber == this.roomNumber &&
          other.capacity == this.capacity);
}

class ClassroomsCompanion extends UpdateCompanion<Classroom> {
  final Value<int> id;
  final Value<String> building;
  final Value<int> roomNumber;
  final Value<int> capacity;
  const ClassroomsCompanion({
    this.id = const Value.absent(),
    this.building = const Value.absent(),
    this.roomNumber = const Value.absent(),
    this.capacity = const Value.absent(),
  });
  ClassroomsCompanion.insert({
    this.id = const Value.absent(),
    required String building,
    required int roomNumber,
    required int capacity,
  })  : building = Value(building),
        roomNumber = Value(roomNumber),
        capacity = Value(capacity);
  static Insertable<Classroom> custom({
    Expression<int>? id,
    Expression<String>? building,
    Expression<int>? roomNumber,
    Expression<int>? capacity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (building != null) 'building': building,
      if (roomNumber != null) 'room_number': roomNumber,
      if (capacity != null) 'capacity': capacity,
    });
  }

  ClassroomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? building,
      Value<int>? roomNumber,
      Value<int>? capacity}) {
    return ClassroomsCompanion(
      id: id ?? this.id,
      building: building ?? this.building,
      roomNumber: roomNumber ?? this.roomNumber,
      capacity: capacity ?? this.capacity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    if (roomNumber.present) {
      map['room_number'] = Variable<int>(roomNumber.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassroomsCompanion(')
          ..write('id: $id, ')
          ..write('building: $building, ')
          ..write('roomNumber: $roomNumber, ')
          ..write('capacity: $capacity')
          ..write(')'))
        .toString();
  }
}

class $DepartmentsTable extends Departments
    with TableInfo<$DepartmentsTable, Department> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepartmentsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> headId = GeneratedColumn<int>(
      'head_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, headId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'departments';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Department map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Department(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      headId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}head_id'])!,
    );
  }

  @override
  $DepartmentsTable createAlias(String alias) {
    return $DepartmentsTable(attachedDatabase, alias);
  }
}

class Department extends DataClass implements Insertable<Department> {
  final int id;
  final String name;
  final int headId;
  const Department(
      {required this.id, required this.name, required this.headId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['head_id'] = Variable<int>(headId);
    return map;
  }

  DepartmentsCompanion toCompanion(bool nullToAbsent) {
    return DepartmentsCompanion(
      id: Value(id),
      name: Value(name),
      headId: Value(headId),
    );
  }

  factory Department.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Department(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      headId: serializer.fromJson<int>(json['headId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'headId': serializer.toJson<int>(headId),
    };
  }

  Department copyWith({int? id, String? name, int? headId}) => Department(
        id: id ?? this.id,
        name: name ?? this.name,
        headId: headId ?? this.headId,
      );
  @override
  String toString() {
    return (StringBuffer('Department(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('headId: $headId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, headId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Department &&
          other.id == this.id &&
          other.name == this.name &&
          other.headId == this.headId);
}

class DepartmentsCompanion extends UpdateCompanion<Department> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> headId;
  const DepartmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.headId = const Value.absent(),
  });
  DepartmentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int headId,
  })  : name = Value(name),
        headId = Value(headId);
  static Insertable<Department> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? headId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (headId != null) 'head_id': headId,
    });
  }

  DepartmentsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? headId}) {
    return DepartmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      headId: headId ?? this.headId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (headId.present) {
      map['head_id'] = Variable<int>(headId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepartmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('headId: $headId')
          ..write(')'))
        .toString();
  }
}

class $TeachersTable extends Teachers with TableInfo<$TeachersTable, Teacher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeachersTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>(
      'department_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES departments (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, email, gender, departmentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teachers';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Teacher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Teacher(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      departmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}department_id'])!,
    );
  }

  @override
  $TeachersTable createAlias(String alias) {
    return $TeachersTable(attachedDatabase, alias);
  }
}

class Teacher extends DataClass implements Insertable<Teacher> {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int departmentId;
  const Teacher(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.departmentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    map['department_id'] = Variable<int>(departmentId);
    return map;
  }

  TeachersCompanion toCompanion(bool nullToAbsent) {
    return TeachersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      gender: Value(gender),
      departmentId: Value(departmentId),
    );
  }

  factory Teacher.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Teacher(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
      departmentId: serializer.fromJson<int>(json['departmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
      'departmentId': serializer.toJson<int>(departmentId),
    };
  }

  Teacher copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          String? email,
          String? gender,
          int? departmentId}) =>
      Teacher(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        departmentId: departmentId ?? this.departmentId,
      );
  @override
  String toString() {
    return (StringBuffer('Teacher(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('departmentId: $departmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, email, gender, departmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Teacher &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.departmentId == this.departmentId);
}

class TeachersCompanion extends UpdateCompanion<Teacher> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> gender;
  final Value<int> departmentId;
  const TeachersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.departmentId = const Value.absent(),
  });
  TeachersCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String email,
    required String gender,
    required int departmentId,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email),
        gender = Value(gender),
        departmentId = Value(departmentId);
  static Insertable<Teacher> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<int>? departmentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (departmentId != null) 'department_id': departmentId,
    });
  }

  TeachersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? email,
      Value<String>? gender,
      Value<int>? departmentId}) {
    return TeachersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeachersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('departmentId: $departmentId')
          ..write(')'))
        .toString();
  }
}

class $DepartmentTeacherLinksTable extends DepartmentTeacherLinks
    with TableInfo<$DepartmentTeacherLinksTable, DepartmentTeacherLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepartmentTeacherLinksTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>(
      'department_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES departments (id)'));
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
      'teacher_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES teachers (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, departmentId, teacherId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'department_teacher_links';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DepartmentTeacherLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DepartmentTeacherLink(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      departmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}department_id'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}teacher_id'])!,
    );
  }

  @override
  $DepartmentTeacherLinksTable createAlias(String alias) {
    return $DepartmentTeacherLinksTable(attachedDatabase, alias);
  }
}

class DepartmentTeacherLink extends DataClass
    implements Insertable<DepartmentTeacherLink> {
  final int id;
  final int departmentId;
  final int teacherId;
  const DepartmentTeacherLink(
      {required this.id, required this.departmentId, required this.teacherId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['department_id'] = Variable<int>(departmentId);
    map['teacher_id'] = Variable<int>(teacherId);
    return map;
  }

  DepartmentTeacherLinksCompanion toCompanion(bool nullToAbsent) {
    return DepartmentTeacherLinksCompanion(
      id: Value(id),
      departmentId: Value(departmentId),
      teacherId: Value(teacherId),
    );
  }

  factory DepartmentTeacherLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DepartmentTeacherLink(
      id: serializer.fromJson<int>(json['id']),
      departmentId: serializer.fromJson<int>(json['departmentId']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'departmentId': serializer.toJson<int>(departmentId),
      'teacherId': serializer.toJson<int>(teacherId),
    };
  }

  DepartmentTeacherLink copyWith(
          {int? id, int? departmentId, int? teacherId}) =>
      DepartmentTeacherLink(
        id: id ?? this.id,
        departmentId: departmentId ?? this.departmentId,
        teacherId: teacherId ?? this.teacherId,
      );
  @override
  String toString() {
    return (StringBuffer('DepartmentTeacherLink(')
          ..write('id: $id, ')
          ..write('departmentId: $departmentId, ')
          ..write('teacherId: $teacherId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, departmentId, teacherId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DepartmentTeacherLink &&
          other.id == this.id &&
          other.departmentId == this.departmentId &&
          other.teacherId == this.teacherId);
}

class DepartmentTeacherLinksCompanion
    extends UpdateCompanion<DepartmentTeacherLink> {
  final Value<int> id;
  final Value<int> departmentId;
  final Value<int> teacherId;
  const DepartmentTeacherLinksCompanion({
    this.id = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.teacherId = const Value.absent(),
  });
  DepartmentTeacherLinksCompanion.insert({
    this.id = const Value.absent(),
    required int departmentId,
    required int teacherId,
  })  : departmentId = Value(departmentId),
        teacherId = Value(teacherId);
  static Insertable<DepartmentTeacherLink> custom({
    Expression<int>? id,
    Expression<int>? departmentId,
    Expression<int>? teacherId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (departmentId != null) 'department_id': departmentId,
      if (teacherId != null) 'teacher_id': teacherId,
    });
  }

  DepartmentTeacherLinksCompanion copyWith(
      {Value<int>? id, Value<int>? departmentId, Value<int>? teacherId}) {
    return DepartmentTeacherLinksCompanion(
      id: id ?? this.id,
      departmentId: departmentId ?? this.departmentId,
      teacherId: teacherId ?? this.teacherId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepartmentTeacherLinksCompanion(')
          ..write('id: $id, ')
          ..write('departmentId: $departmentId, ')
          ..write('teacherId: $teacherId')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
      'start_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
      'end_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_date'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  const Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['start_date'] = Variable<String>(startDate);
    map['end_date'] = Variable<String>(endDate);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String>(endDate),
    };
  }

  Event copyWith(
          {int? id,
          String? title,
          String? description,
          String? startDate,
          String? endDate}) =>
      Event(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> startDate;
  final Value<String> endDate;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String startDate,
    required String endDate,
  })  : title = Value(title),
        description = Value(description),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? startDate,
    Expression<String>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  EventsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? startDate,
      Value<String>? endDate}) {
    return EventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $GTOsTable extends GTOs with TableInfo<$GTOsTable, GTO> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GTOsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'g_t_os';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GTO map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GTO(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GTOsTable createAlias(String alias) {
    return $GTOsTable(attachedDatabase, alias);
  }
}

class GTO extends DataClass implements Insertable<GTO> {
  final int id;
  final String name;
  const GTO({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GTOsCompanion toCompanion(bool nullToAbsent) {
    return GTOsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory GTO.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GTO(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GTO copyWith({int? id, String? name}) => GTO(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('GTO(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GTO && other.id == this.id && other.name == this.name);
}

class GTOsCompanion extends UpdateCompanion<GTO> {
  final Value<int> id;
  final Value<String> name;
  const GTOsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GTOsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<GTO> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GTOsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GTOsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GTOsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $LibrariesTable extends Libraries
    with TableInfo<$LibrariesTable, Library> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LibrariesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> bookId = GeneratedColumn<int>(
      'book_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<bool> availability = GeneratedColumn<bool>(
      'availability', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("availability" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, bookId, availability];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'libraries';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Library map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Library(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      bookId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}book_id'])!,
      availability: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}availability'])!,
    );
  }

  @override
  $LibrariesTable createAlias(String alias) {
    return $LibrariesTable(attachedDatabase, alias);
  }
}

class Library extends DataClass implements Insertable<Library> {
  final int id;
  final int bookId;
  final bool availability;
  const Library(
      {required this.id, required this.bookId, required this.availability});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['book_id'] = Variable<int>(bookId);
    map['availability'] = Variable<bool>(availability);
    return map;
  }

  LibrariesCompanion toCompanion(bool nullToAbsent) {
    return LibrariesCompanion(
      id: Value(id),
      bookId: Value(bookId),
      availability: Value(availability),
    );
  }

  factory Library.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Library(
      id: serializer.fromJson<int>(json['id']),
      bookId: serializer.fromJson<int>(json['bookId']),
      availability: serializer.fromJson<bool>(json['availability']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookId': serializer.toJson<int>(bookId),
      'availability': serializer.toJson<bool>(availability),
    };
  }

  Library copyWith({int? id, int? bookId, bool? availability}) => Library(
        id: id ?? this.id,
        bookId: bookId ?? this.bookId,
        availability: availability ?? this.availability,
      );
  @override
  String toString() {
    return (StringBuffer('Library(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('availability: $availability')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookId, availability);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Library &&
          other.id == this.id &&
          other.bookId == this.bookId &&
          other.availability == this.availability);
}

class LibrariesCompanion extends UpdateCompanion<Library> {
  final Value<int> id;
  final Value<int> bookId;
  final Value<bool> availability;
  const LibrariesCompanion({
    this.id = const Value.absent(),
    this.bookId = const Value.absent(),
    this.availability = const Value.absent(),
  });
  LibrariesCompanion.insert({
    this.id = const Value.absent(),
    required int bookId,
    required bool availability,
  })  : bookId = Value(bookId),
        availability = Value(availability);
  static Insertable<Library> custom({
    Expression<int>? id,
    Expression<int>? bookId,
    Expression<bool>? availability,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookId != null) 'book_id': bookId,
      if (availability != null) 'availability': availability,
    });
  }

  LibrariesCompanion copyWith(
      {Value<int>? id, Value<int>? bookId, Value<bool>? availability}) {
    return LibrariesCompanion(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      availability: availability ?? this.availability,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (availability.present) {
      map['availability'] = Variable<bool>(availability.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LibrariesCompanion(')
          ..write('id: $id, ')
          ..write('bookId: $bookId, ')
          ..write('availability: $availability')
          ..write(')'))
        .toString();
  }
}

class $MarksTable extends Marks with TableInfo<$MarksTable, Mark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarksTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> grade = GeneratedColumn<int>(
      'grade', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, grade];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'marks';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mark(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade'])!,
    );
  }

  @override
  $MarksTable createAlias(String alias) {
    return $MarksTable(attachedDatabase, alias);
  }
}

class Mark extends DataClass implements Insertable<Mark> {
  final int id;
  final int grade;
  const Mark({required this.id, required this.grade});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['grade'] = Variable<int>(grade);
    return map;
  }

  MarksCompanion toCompanion(bool nullToAbsent) {
    return MarksCompanion(
      id: Value(id),
      grade: Value(grade),
    );
  }

  factory Mark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mark(
      id: serializer.fromJson<int>(json['id']),
      grade: serializer.fromJson<int>(json['grade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'grade': serializer.toJson<int>(grade),
    };
  }

  Mark copyWith({int? id, int? grade}) => Mark(
        id: id ?? this.id,
        grade: grade ?? this.grade,
      );
  @override
  String toString() {
    return (StringBuffer('Mark(')
          ..write('id: $id, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, grade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mark && other.id == this.id && other.grade == this.grade);
}

class MarksCompanion extends UpdateCompanion<Mark> {
  final Value<int> id;
  final Value<int> grade;
  const MarksCompanion({
    this.id = const Value.absent(),
    this.grade = const Value.absent(),
  });
  MarksCompanion.insert({
    this.id = const Value.absent(),
    required int grade,
  }) : grade = Value(grade);
  static Insertable<Mark> custom({
    Expression<int>? id,
    Expression<int>? grade,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (grade != null) 'grade': grade,
    });
  }

  MarksCompanion copyWith({Value<int>? id, Value<int>? grade}) {
    return MarksCompanion(
      id: id ?? this.id,
      grade: grade ?? this.grade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarksCompanion(')
          ..write('id: $id, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }
}

class $NewsTable extends News with TableInfo<$NewsTable, ONews> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> publicationDate = GeneratedColumn<String>(
      'publication_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, content, publicationDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ONews map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ONews(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      publicationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}publication_date'])!,
    );
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(attachedDatabase, alias);
  }
}

class ONews extends DataClass implements Insertable<ONews> {
  final int id;
  final String title;
  final String content;
  final String publicationDate;
  const ONews(
      {required this.id,
      required this.title,
      required this.content,
      required this.publicationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['publication_date'] = Variable<String>(publicationDate);
    return map;
  }

  NewsCompanion toCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      publicationDate: Value(publicationDate),
    );
  }

  factory ONews.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ONews(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      publicationDate: serializer.fromJson<String>(json['publicationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'publicationDate': serializer.toJson<String>(publicationDate),
    };
  }

  ONews copyWith(
          {int? id, String? title, String? content, String? publicationDate}) =>
      ONews(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        publicationDate: publicationDate ?? this.publicationDate,
      );
  @override
  String toString() {
    return (StringBuffer('ONews(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('publicationDate: $publicationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, publicationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ONews &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.publicationDate == this.publicationDate);
}

class NewsCompanion extends UpdateCompanion<ONews> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> publicationDate;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.publicationDate = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required String publicationDate,
  })  : title = Value(title),
        content = Value(content),
        publicationDate = Value(publicationDate);
  static Insertable<ONews> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? publicationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (publicationDate != null) 'publication_date': publicationDate,
    });
  }

  NewsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? publicationDate}) {
    return NewsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      publicationDate: publicationDate ?? this.publicationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (publicationDate.present) {
      map['publication_date'] = Variable<String>(publicationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('publicationDate: $publicationDate')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
      'start_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
      'end_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, startDate, endDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_date'])!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  const Project(
      {required this.id,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['start_date'] = Variable<String>(startDate);
    map['end_date'] = Variable<String>(endDate);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      startDate: Value(startDate),
      endDate: Value(endDate),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String>(endDate),
    };
  }

  Project copyWith(
          {int? id,
          String? title,
          String? description,
          String? startDate,
          String? endDate}) =>
      Project(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, startDate, endDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> startDate;
  final Value<String> endDate;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String startDate,
    required String endDate,
  })  : title = Value(title),
        description = Value(description),
        startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? startDate,
    Expression<String>? endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  ProjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? startDate,
      Value<String>? endDate}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
      'weekday', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> classroomId = GeneratedColumn<int>(
      'classroom_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES classrooms (id)'));
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (id)'));
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES subjects (id)'));
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
      'teacher_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES teachers (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        weekday,
        startTime,
        endTime,
        classroomId,
        groupId,
        subjectId,
        teacherId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      weekday: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weekday'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time'])!,
      classroomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}classroom_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}teacher_id'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final int weekday;
  final String startTime;
  final String endTime;
  final int classroomId;
  final int groupId;
  final int subjectId;
  final int teacherId;
  const Schedule(
      {required this.id,
      required this.weekday,
      required this.startTime,
      required this.endTime,
      required this.classroomId,
      required this.groupId,
      required this.subjectId,
      required this.teacherId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weekday'] = Variable<int>(weekday);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    map['classroom_id'] = Variable<int>(classroomId);
    map['group_id'] = Variable<int>(groupId);
    map['subject_id'] = Variable<int>(subjectId);
    map['teacher_id'] = Variable<int>(teacherId);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      weekday: Value(weekday),
      startTime: Value(startTime),
      endTime: Value(endTime),
      classroomId: Value(classroomId),
      groupId: Value(groupId),
      subjectId: Value(subjectId),
      teacherId: Value(teacherId),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      weekday: serializer.fromJson<int>(json['weekday']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      classroomId: serializer.fromJson<int>(json['classroomId']),
      groupId: serializer.fromJson<int>(json['groupId']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weekday': serializer.toJson<int>(weekday),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'classroomId': serializer.toJson<int>(classroomId),
      'groupId': serializer.toJson<int>(groupId),
      'subjectId': serializer.toJson<int>(subjectId),
      'teacherId': serializer.toJson<int>(teacherId),
    };
  }

  Schedule copyWith(
          {int? id,
          int? weekday,
          String? startTime,
          String? endTime,
          int? classroomId,
          int? groupId,
          int? subjectId,
          int? teacherId}) =>
      Schedule(
        id: id ?? this.id,
        weekday: weekday ?? this.weekday,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        classroomId: classroomId ?? this.classroomId,
        groupId: groupId ?? this.groupId,
        subjectId: subjectId ?? this.subjectId,
        teacherId: teacherId ?? this.teacherId,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('weekday: $weekday, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('classroomId: $classroomId, ')
          ..write('groupId: $groupId, ')
          ..write('subjectId: $subjectId, ')
          ..write('teacherId: $teacherId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weekday, startTime, endTime, classroomId,
      groupId, subjectId, teacherId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.weekday == this.weekday &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.classroomId == this.classroomId &&
          other.groupId == this.groupId &&
          other.subjectId == this.subjectId &&
          other.teacherId == this.teacherId);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<int> weekday;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<int> classroomId;
  final Value<int> groupId;
  final Value<int> subjectId;
  final Value<int> teacherId;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.weekday = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.classroomId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.teacherId = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required int weekday,
    required String startTime,
    required String endTime,
    required int classroomId,
    required int groupId,
    required int subjectId,
    required int teacherId,
  })  : weekday = Value(weekday),
        startTime = Value(startTime),
        endTime = Value(endTime),
        classroomId = Value(classroomId),
        groupId = Value(groupId),
        subjectId = Value(subjectId),
        teacherId = Value(teacherId);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<int>? weekday,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? classroomId,
    Expression<int>? groupId,
    Expression<int>? subjectId,
    Expression<int>? teacherId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekday != null) 'weekday': weekday,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (classroomId != null) 'classroom_id': classroomId,
      if (groupId != null) 'group_id': groupId,
      if (subjectId != null) 'subject_id': subjectId,
      if (teacherId != null) 'teacher_id': teacherId,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<int>? weekday,
      Value<String>? startTime,
      Value<String>? endTime,
      Value<int>? classroomId,
      Value<int>? groupId,
      Value<int>? subjectId,
      Value<int>? teacherId}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      weekday: weekday ?? this.weekday,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      classroomId: classroomId ?? this.classroomId,
      groupId: groupId ?? this.groupId,
      subjectId: subjectId ?? this.subjectId,
      teacherId: teacherId ?? this.teacherId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (classroomId.present) {
      map['classroom_id'] = Variable<int>(classroomId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('weekday: $weekday, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('classroomId: $classroomId, ')
          ..write('groupId: $groupId, ')
          ..write('subjectId: $subjectId, ')
          ..write('teacherId: $teacherId')
          ..write(')'))
        .toString();
  }
}

class $SportTeamsTable extends SportTeams
    with TableInfo<$SportTeamsTable, SportTeam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SportTeamsTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sport_teams';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SportTeam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SportTeam(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SportTeamsTable createAlias(String alias) {
    return $SportTeamsTable(attachedDatabase, alias);
  }
}

class SportTeam extends DataClass implements Insertable<SportTeam> {
  final int id;
  final String name;
  const SportTeam({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SportTeamsCompanion toCompanion(bool nullToAbsent) {
    return SportTeamsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory SportTeam.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SportTeam(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SportTeam copyWith({int? id, String? name}) => SportTeam(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('SportTeam(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SportTeam && other.id == this.id && other.name == this.name);
}

class SportTeamsCompanion extends UpdateCompanion<SportTeam> {
  final Value<int> id;
  final Value<String> name;
  const SportTeamsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SportTeamsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SportTeam> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SportTeamsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SportTeamsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SportTeamsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SportActivitiesTable extends SportActivities
    with TableInfo<$SportActivitiesTable, SportActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SportActivitiesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> gTOId = GeneratedColumn<int>(
      'g_t_o_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES g_t_os (id)'));
  @override
  late final GeneratedColumn<int> sportTeamsId = GeneratedColumn<int>(
      'sport_teams_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sport_teams (id)'));
  @override
  late final GeneratedColumn<int> allianceId = GeneratedColumn<int>(
      'alliance_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES alliances (id)'));
  @override
  List<GeneratedColumn> get $columns => [name, gTOId, sportTeamsId, allianceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sport_activities';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SportActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SportActivity(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      gTOId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}g_t_o_id'])!,
      sportTeamsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sport_teams_id'])!,
      allianceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}alliance_id'])!,
    );
  }

  @override
  $SportActivitiesTable createAlias(String alias) {
    return $SportActivitiesTable(attachedDatabase, alias);
  }
}

class SportActivity extends DataClass implements Insertable<SportActivity> {
  final String name;
  final int gTOId;
  final int sportTeamsId;
  final int allianceId;
  const SportActivity(
      {required this.name,
      required this.gTOId,
      required this.sportTeamsId,
      required this.allianceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['g_t_o_id'] = Variable<int>(gTOId);
    map['sport_teams_id'] = Variable<int>(sportTeamsId);
    map['alliance_id'] = Variable<int>(allianceId);
    return map;
  }

  SportActivitiesCompanion toCompanion(bool nullToAbsent) {
    return SportActivitiesCompanion(
      name: Value(name),
      gTOId: Value(gTOId),
      sportTeamsId: Value(sportTeamsId),
      allianceId: Value(allianceId),
    );
  }

  factory SportActivity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SportActivity(
      name: serializer.fromJson<String>(json['name']),
      gTOId: serializer.fromJson<int>(json['gTOId']),
      sportTeamsId: serializer.fromJson<int>(json['sportTeamsId']),
      allianceId: serializer.fromJson<int>(json['allianceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'gTOId': serializer.toJson<int>(gTOId),
      'sportTeamsId': serializer.toJson<int>(sportTeamsId),
      'allianceId': serializer.toJson<int>(allianceId),
    };
  }

  SportActivity copyWith(
          {String? name, int? gTOId, int? sportTeamsId, int? allianceId}) =>
      SportActivity(
        name: name ?? this.name,
        gTOId: gTOId ?? this.gTOId,
        sportTeamsId: sportTeamsId ?? this.sportTeamsId,
        allianceId: allianceId ?? this.allianceId,
      );
  @override
  String toString() {
    return (StringBuffer('SportActivity(')
          ..write('name: $name, ')
          ..write('gTOId: $gTOId, ')
          ..write('sportTeamsId: $sportTeamsId, ')
          ..write('allianceId: $allianceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, gTOId, sportTeamsId, allianceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SportActivity &&
          other.name == this.name &&
          other.gTOId == this.gTOId &&
          other.sportTeamsId == this.sportTeamsId &&
          other.allianceId == this.allianceId);
}

class SportActivitiesCompanion extends UpdateCompanion<SportActivity> {
  final Value<String> name;
  final Value<int> gTOId;
  final Value<int> sportTeamsId;
  final Value<int> allianceId;
  final Value<int> rowid;
  const SportActivitiesCompanion({
    this.name = const Value.absent(),
    this.gTOId = const Value.absent(),
    this.sportTeamsId = const Value.absent(),
    this.allianceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SportActivitiesCompanion.insert({
    required String name,
    required int gTOId,
    required int sportTeamsId,
    required int allianceId,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        gTOId = Value(gTOId),
        sportTeamsId = Value(sportTeamsId),
        allianceId = Value(allianceId);
  static Insertable<SportActivity> custom({
    Expression<String>? name,
    Expression<int>? gTOId,
    Expression<int>? sportTeamsId,
    Expression<int>? allianceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (gTOId != null) 'g_t_o_id': gTOId,
      if (sportTeamsId != null) 'sport_teams_id': sportTeamsId,
      if (allianceId != null) 'alliance_id': allianceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SportActivitiesCompanion copyWith(
      {Value<String>? name,
      Value<int>? gTOId,
      Value<int>? sportTeamsId,
      Value<int>? allianceId,
      Value<int>? rowid}) {
    return SportActivitiesCompanion(
      name: name ?? this.name,
      gTOId: gTOId ?? this.gTOId,
      sportTeamsId: sportTeamsId ?? this.sportTeamsId,
      allianceId: allianceId ?? this.allianceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gTOId.present) {
      map['g_t_o_id'] = Variable<int>(gTOId.value);
    }
    if (sportTeamsId.present) {
      map['sport_teams_id'] = Variable<int>(sportTeamsId.value);
    }
    if (allianceId.present) {
      map['alliance_id'] = Variable<int>(allianceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SportActivitiesCompanion(')
          ..write('name: $name, ')
          ..write('gTOId: $gTOId, ')
          ..write('sportTeamsId: $sportTeamsId, ')
          ..write('allianceId: $allianceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubjectTeacherLinksTable extends SubjectTeacherLinks
    with TableInfo<$SubjectTeacherLinksTable, SubjectTeacherLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectTeacherLinksTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>(
      'department_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
      'teacher_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [departmentId, teacherId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_teacher_links';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SubjectTeacherLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectTeacherLink(
      departmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}department_id'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}teacher_id'])!,
    );
  }

  @override
  $SubjectTeacherLinksTable createAlias(String alias) {
    return $SubjectTeacherLinksTable(attachedDatabase, alias);
  }
}

class SubjectTeacherLink extends DataClass
    implements Insertable<SubjectTeacherLink> {
  final int departmentId;
  final int teacherId;
  const SubjectTeacherLink(
      {required this.departmentId, required this.teacherId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['department_id'] = Variable<int>(departmentId);
    map['teacher_id'] = Variable<int>(teacherId);
    return map;
  }

  SubjectTeacherLinksCompanion toCompanion(bool nullToAbsent) {
    return SubjectTeacherLinksCompanion(
      departmentId: Value(departmentId),
      teacherId: Value(teacherId),
    );
  }

  factory SubjectTeacherLink.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectTeacherLink(
      departmentId: serializer.fromJson<int>(json['departmentId']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'departmentId': serializer.toJson<int>(departmentId),
      'teacherId': serializer.toJson<int>(teacherId),
    };
  }

  SubjectTeacherLink copyWith({int? departmentId, int? teacherId}) =>
      SubjectTeacherLink(
        departmentId: departmentId ?? this.departmentId,
        teacherId: teacherId ?? this.teacherId,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectTeacherLink(')
          ..write('departmentId: $departmentId, ')
          ..write('teacherId: $teacherId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(departmentId, teacherId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectTeacherLink &&
          other.departmentId == this.departmentId &&
          other.teacherId == this.teacherId);
}

class SubjectTeacherLinksCompanion extends UpdateCompanion<SubjectTeacherLink> {
  final Value<int> departmentId;
  final Value<int> teacherId;
  final Value<int> rowid;
  const SubjectTeacherLinksCompanion({
    this.departmentId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectTeacherLinksCompanion.insert({
    required int departmentId,
    required int teacherId,
    this.rowid = const Value.absent(),
  })  : departmentId = Value(departmentId),
        teacherId = Value(teacherId);
  static Insertable<SubjectTeacherLink> custom({
    Expression<int>? departmentId,
    Expression<int>? teacherId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (departmentId != null) 'department_id': departmentId,
      if (teacherId != null) 'teacher_id': teacherId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectTeacherLinksCompanion copyWith(
      {Value<int>? departmentId, Value<int>? teacherId, Value<int>? rowid}) {
    return SubjectTeacherLinksCompanion(
      departmentId: departmentId ?? this.departmentId,
      teacherId: teacherId ?? this.teacherId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectTeacherLinksCompanion(')
          ..write('departmentId: $departmentId, ')
          ..write('teacherId: $teacherId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyllabusTable extends Syllabus with TableInfo<$SyllabusTable, Syllabu> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyllabusTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'syllabus';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Syllabu map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Syllabu(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SyllabusTable createAlias(String alias) {
    return $SyllabusTable(attachedDatabase, alias);
  }
}

class Syllabu extends DataClass implements Insertable<Syllabu> {
  final int id;
  final String name;
  const Syllabu({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SyllabusCompanion toCompanion(bool nullToAbsent) {
    return SyllabusCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Syllabu.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Syllabu(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Syllabu copyWith({int? id, String? name}) => Syllabu(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Syllabu(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Syllabu && other.id == this.id && other.name == this.name);
}

class SyllabusCompanion extends UpdateCompanion<Syllabu> {
  final Value<int> id;
  final Value<String> name;
  const SyllabusCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SyllabusCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Syllabu> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SyllabusCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SyllabusCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyllabusCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TorchesTable extends Torches with TableInfo<$TorchesTable, Torch> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TorchesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'torches';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Torch map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Torch(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TorchesTable createAlias(String alias) {
    return $TorchesTable(attachedDatabase, alias);
  }
}

class Torch extends DataClass implements Insertable<Torch> {
  final int id;
  final String date;
  final String description;
  const Torch(
      {required this.id, required this.date, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<String>(date);
    map['description'] = Variable<String>(description);
    return map;
  }

  TorchesCompanion toCompanion(bool nullToAbsent) {
    return TorchesCompanion(
      id: Value(id),
      date: Value(date),
      description: Value(description),
    );
  }

  factory Torch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Torch(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<String>(json['date']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<String>(date),
      'description': serializer.toJson<String>(description),
    };
  }

  Torch copyWith({int? id, String? date, String? description}) => Torch(
        id: id ?? this.id,
        date: date ?? this.date,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Torch(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Torch &&
          other.id == this.id &&
          other.date == this.date &&
          other.description == this.description);
}

class TorchesCompanion extends UpdateCompanion<Torch> {
  final Value<int> id;
  final Value<String> date;
  final Value<String> description;
  const TorchesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
  });
  TorchesCompanion.insert({
    this.id = const Value.absent(),
    required String date,
    required String description,
  })  : date = Value(date),
        description = Value(description);
  static Insertable<Torch> custom({
    Expression<int>? id,
    Expression<String>? date,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
    });
  }

  TorchesCompanion copyWith(
      {Value<int>? id, Value<String>? date, Value<String>? description}) {
    return TorchesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TorchesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $VolunteeringTable extends Volunteering
    with TableInfo<$VolunteeringTable, OVolunteering> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VolunteeringTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'volunteering';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OVolunteering map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OVolunteering(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $VolunteeringTable createAlias(String alias) {
    return $VolunteeringTable(attachedDatabase, alias);
  }
}

class OVolunteering extends DataClass implements Insertable<OVolunteering> {
  final int id;
  final String name;
  final String date;
  const OVolunteering(
      {required this.id, required this.name, required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<String>(date);
    return map;
  }

  VolunteeringCompanion toCompanion(bool nullToAbsent) {
    return VolunteeringCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
    );
  }

  factory OVolunteering.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OVolunteering(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<String>(date),
    };
  }

  OVolunteering copyWith({int? id, String? name, String? date}) =>
      OVolunteering(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('OVolunteering(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OVolunteering &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date);
}

class VolunteeringCompanion extends UpdateCompanion<OVolunteering> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> date;
  const VolunteeringCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
  });
  VolunteeringCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String date,
  })  : name = Value(name),
        date = Value(date);
  static Insertable<OVolunteering> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
    });
  }

  VolunteeringCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? date}) {
    return VolunteeringCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VolunteeringCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $TypesOfActivitiesTable extends TypesOfActivities
    with TableInfo<$TypesOfActivitiesTable, TypeOfActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TypesOfActivitiesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES students (id)'));
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES "groups" (id)'));
  @override
  late final GeneratedColumn<int> volunteeringId = GeneratedColumn<int>(
      'volunteering_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES volunteering (id)'));
  @override
  late final GeneratedColumn<int> torchId = GeneratedColumn<int>(
      'torch_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES torches (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [studentId, groupId, volunteeringId, torchId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'types_of_activities';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TypeOfActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TypeOfActivity(
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      volunteeringId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}volunteering_id'])!,
      torchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}torch_id'])!,
    );
  }

  @override
  $TypesOfActivitiesTable createAlias(String alias) {
    return $TypesOfActivitiesTable(attachedDatabase, alias);
  }
}

class TypeOfActivity extends DataClass implements Insertable<TypeOfActivity> {
  final int studentId;
  final int groupId;
  final int volunteeringId;
  final int torchId;
  const TypeOfActivity(
      {required this.studentId,
      required this.groupId,
      required this.volunteeringId,
      required this.torchId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<int>(studentId);
    map['group_id'] = Variable<int>(groupId);
    map['volunteering_id'] = Variable<int>(volunteeringId);
    map['torch_id'] = Variable<int>(torchId);
    return map;
  }

  TypesOfActivitiesCompanion toCompanion(bool nullToAbsent) {
    return TypesOfActivitiesCompanion(
      studentId: Value(studentId),
      groupId: Value(groupId),
      volunteeringId: Value(volunteeringId),
      torchId: Value(torchId),
    );
  }

  factory TypeOfActivity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TypeOfActivity(
      studentId: serializer.fromJson<int>(json['studentId']),
      groupId: serializer.fromJson<int>(json['groupId']),
      volunteeringId: serializer.fromJson<int>(json['volunteeringId']),
      torchId: serializer.fromJson<int>(json['torchId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<int>(studentId),
      'groupId': serializer.toJson<int>(groupId),
      'volunteeringId': serializer.toJson<int>(volunteeringId),
      'torchId': serializer.toJson<int>(torchId),
    };
  }

  TypeOfActivity copyWith(
          {int? studentId, int? groupId, int? volunteeringId, int? torchId}) =>
      TypeOfActivity(
        studentId: studentId ?? this.studentId,
        groupId: groupId ?? this.groupId,
        volunteeringId: volunteeringId ?? this.volunteeringId,
        torchId: torchId ?? this.torchId,
      );
  @override
  String toString() {
    return (StringBuffer('TypeOfActivity(')
          ..write('studentId: $studentId, ')
          ..write('groupId: $groupId, ')
          ..write('volunteeringId: $volunteeringId, ')
          ..write('torchId: $torchId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studentId, groupId, volunteeringId, torchId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TypeOfActivity &&
          other.studentId == this.studentId &&
          other.groupId == this.groupId &&
          other.volunteeringId == this.volunteeringId &&
          other.torchId == this.torchId);
}

class TypesOfActivitiesCompanion extends UpdateCompanion<TypeOfActivity> {
  final Value<int> studentId;
  final Value<int> groupId;
  final Value<int> volunteeringId;
  final Value<int> torchId;
  final Value<int> rowid;
  const TypesOfActivitiesCompanion({
    this.studentId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.volunteeringId = const Value.absent(),
    this.torchId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TypesOfActivitiesCompanion.insert({
    required int studentId,
    required int groupId,
    required int volunteeringId,
    required int torchId,
    this.rowid = const Value.absent(),
  })  : studentId = Value(studentId),
        groupId = Value(groupId),
        volunteeringId = Value(volunteeringId),
        torchId = Value(torchId);
  static Insertable<TypeOfActivity> custom({
    Expression<int>? studentId,
    Expression<int>? groupId,
    Expression<int>? volunteeringId,
    Expression<int>? torchId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (groupId != null) 'group_id': groupId,
      if (volunteeringId != null) 'volunteering_id': volunteeringId,
      if (torchId != null) 'torch_id': torchId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TypesOfActivitiesCompanion copyWith(
      {Value<int>? studentId,
      Value<int>? groupId,
      Value<int>? volunteeringId,
      Value<int>? torchId,
      Value<int>? rowid}) {
    return TypesOfActivitiesCompanion(
      studentId: studentId ?? this.studentId,
      groupId: groupId ?? this.groupId,
      volunteeringId: volunteeringId ?? this.volunteeringId,
      torchId: torchId ?? this.torchId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (volunteeringId.present) {
      map['volunteering_id'] = Variable<int>(volunteeringId.value);
    }
    if (torchId.present) {
      map['torch_id'] = Variable<int>(torchId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypesOfActivitiesCompanion(')
          ..write('studentId: $studentId, ')
          ..write('groupId: $groupId, ')
          ..write('volunteeringId: $volunteeringId, ')
          ..write('torchId: $torchId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UniversityDormitoriesTable extends UniversityDormitories
    with TableInfo<$UniversityDormitoriesTable, UniversityDormitory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UniversityDormitoriesTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'university_dormitories';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UniversityDormitory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UniversityDormitory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
    );
  }

  @override
  $UniversityDormitoriesTable createAlias(String alias) {
    return $UniversityDormitoriesTable(attachedDatabase, alias);
  }
}

class UniversityDormitory extends DataClass
    implements Insertable<UniversityDormitory> {
  final int id;
  final String name;
  final String address;
  const UniversityDormitory(
      {required this.id, required this.name, required this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    return map;
  }

  UniversityDormitoriesCompanion toCompanion(bool nullToAbsent) {
    return UniversityDormitoriesCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
    );
  }

  factory UniversityDormitory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UniversityDormitory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
    };
  }

  UniversityDormitory copyWith({int? id, String? name, String? address}) =>
      UniversityDormitory(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
      );
  @override
  String toString() {
    return (StringBuffer('UniversityDormitory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UniversityDormitory &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address);
}

class UniversityDormitoriesCompanion
    extends UpdateCompanion<UniversityDormitory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  const UniversityDormitoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
  });
  UniversityDormitoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
  })  : name = Value(name),
        address = Value(address);
  static Insertable<UniversityDormitory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
    });
  }

  UniversityDormitoriesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? address}) {
    return UniversityDormitoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UniversityDormitoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

abstract class _$UniversityDatabase extends GeneratedDatabase {
  _$UniversityDatabase(QueryExecutor e) : super(e);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $ExamsTable exams = $ExamsTable(this);
  late final $AccuracyTablesTable accuracyTables = $AccuracyTablesTable(this);
  late final $AlliancesTable alliances = $AlliancesTable(this);
  late final $BooksTable books = $BooksTable(this);
  late final $ClassroomsTable classrooms = $ClassroomsTable(this);
  late final $DepartmentsTable departments = $DepartmentsTable(this);
  late final $TeachersTable teachers = $TeachersTable(this);
  late final $DepartmentTeacherLinksTable departmentTeacherLinks =
      $DepartmentTeacherLinksTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $GTOsTable gTOs = $GTOsTable(this);
  late final $LibrariesTable libraries = $LibrariesTable(this);
  late final $MarksTable marks = $MarksTable(this);
  late final $NewsTable news = $NewsTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  late final $SportTeamsTable sportTeams = $SportTeamsTable(this);
  late final $SportActivitiesTable sportActivities =
      $SportActivitiesTable(this);
  late final $SubjectTeacherLinksTable subjectTeacherLinks =
      $SubjectTeacherLinksTable(this);
  late final $SyllabusTable syllabus = $SyllabusTable(this);
  late final $TorchesTable torches = $TorchesTable(this);
  late final $VolunteeringTable volunteering = $VolunteeringTable(this);
  late final $TypesOfActivitiesTable typesOfActivities =
      $TypesOfActivitiesTable(this);
  late final $UniversityDormitoriesTable universityDormitories =
      $UniversityDormitoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        groups,
        students,
        subjects,
        exams,
        accuracyTables,
        alliances,
        books,
        classrooms,
        departments,
        teachers,
        departmentTeacherLinks,
        events,
        gTOs,
        libraries,
        marks,
        news,
        projects,
        schedules,
        sportTeams,
        sportActivities,
        subjectTeacherLinks,
        syllabus,
        torches,
        volunteering,
        typesOfActivities,
        universityDormitories
      ];
}
