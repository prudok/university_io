import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class DepartmentTeacherLinkRepository {
  Future<void> add(DepartmentTeacherLinksCompanion department);

  Future<void> delete(int id);

  Future<List<DepartmentTeacherLink>> getAll();
}
