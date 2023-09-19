import 'package:education_portal/features/data/datasource/databases/databases.dart';
import 'package:education_portal/features/domain/repositories/student_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl({required PeopleDatabase db}) : _db = db;

  final PeopleDatabase _db;

  @override
  Future<void> add(StudentsCompanion student) async {
    await _db.into(_db.students).insert(student);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteStudent(id);
  }

  @override
  Future<Student> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> getAll() {
    return _db.studentsList;
  }
}