import 'package:drift/drift.dart';
import 'package:university_io/features/data/datasource/tables/tables.dart';

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().references(Groups, #id)();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get address => text().nullable()();
}
