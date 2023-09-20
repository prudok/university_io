import 'package:drift/drift.dart';

class DepartmentTeacherLink extends Table {
  IntColumn get departmentId => integer()();
  IntColumn get teacherId => integer()();
}
