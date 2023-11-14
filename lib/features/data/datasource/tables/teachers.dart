import 'package:drift/drift.dart';
import 'package:university_io/features/data/datasource/tables/tables.dart';

class Teachers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get gender => text()();
  IntColumn get departmentId => integer().references(Departments, #id)();
}
