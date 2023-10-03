import 'package:education_portal/features/data/datasource/database/university_db.dart';

class DepartmentWithTeachers {
  DepartmentWithTeachers(this.department, this.teachers);

  final Department department;
  final List<Teacher> teachers;
}
