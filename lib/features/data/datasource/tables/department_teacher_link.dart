import 'package:drift/drift.dart';

class DepartmentTeacherLinks extends Table {
  IntColumn get departmentId => integer()();
  IntColumn get teacherId => integer()();
}
