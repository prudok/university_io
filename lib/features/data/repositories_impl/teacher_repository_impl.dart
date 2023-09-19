import 'package:education_portal/features/data/datasource/databases/databases.dart';
import 'package:education_portal/features/domain/repositories/teacher_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class TeacherRepositoryImpl extends TeacherRepository {
  TeacherRepositoryImpl({required PeopleDatabase db}) : _db = db;

  final PeopleDatabase _db;

  @override
  Future<void> add(TeachersCompanion teacher) async {
    await _db.into(_db.teachers).insert(teacher);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteTeacher(id);
  }

  @override
  Future<Teacher> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Teacher>> getAll() {
    return _db.teachersList;
  }
}