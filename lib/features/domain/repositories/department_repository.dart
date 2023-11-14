import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class DepartmentRepository {
  Future<void> add(DepartmentsCompanion department);
  Future<void> delete(int id);
  Future<List<Department>> getAll();
}
