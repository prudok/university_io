import 'package:education_portal/features/data/datasource/database/university_db.dart';

abstract class DepartmentRepository {
  Future<void> add(DepartmentsCompanion department);
  Future<void> delete(int id);
  Future<Department> get(int id);
  Future<List<Department>> getAll();
}
