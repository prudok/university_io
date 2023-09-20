import 'package:drift/drift.dart';

class Department extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
