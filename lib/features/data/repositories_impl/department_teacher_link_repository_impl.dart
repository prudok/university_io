import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class DepartmentTeacherLinkRepositoryImpl extends DepartmentTeacherLinkRepository {
  DepartmentTeacherLinkRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(DepartmentTeacherLinksCompanion department) async {
    await _db.into(_db.departmentTeacherLinks).insert(department);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteDepartmentTeacherLink(id);
  }

  @override
  Future<List<DepartmentTeacherLink>> getAll() {
    return _db.departmentTeacherLinksList;
  }
}
