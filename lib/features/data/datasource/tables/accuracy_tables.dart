import 'package:drift/drift.dart';
import 'package:education_portal/features/data/datasource/tables/tables.dart';

@DataClassName('AccuracyTable')
class AccuracyTables extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentId => integer().references(Students, #id)();
  IntColumn get groupId => integer().references(Groups, #id)();
  IntColumn get subjectId => integer().references(Subjects, #id)();
  IntColumn get examId => integer().references(Exams, #id)();
}
