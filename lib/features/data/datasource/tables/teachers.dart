import 'package:drift/drift.dart';

class Teachers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get dateOfBirth => text().nullable()();
  TextColumn get adress => text().nullable()();
  TextColumn get gender => text().nullable()();
  IntColumn get departmentId => integer().nullable()();
}
