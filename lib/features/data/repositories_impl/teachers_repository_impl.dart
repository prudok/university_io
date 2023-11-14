import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class TeacherRepositoryImpl extends TeacherRepository {
  TeacherRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(TeachersCompanion teacher) async {
    await _db.into(_db.teachers).insert(teacher);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteTeacher(id);
  }

  @override
  Future<List<Teacher>> getAll() {
    return _db.teachersList;
  }
}
