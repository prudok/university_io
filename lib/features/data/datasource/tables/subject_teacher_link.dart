import 'package:drift/drift.dart';

class SubjectTeacherLinks extends Table {
  IntColumn get departmentId => integer()();
  IntColumn get teacherId => integer()();
}
