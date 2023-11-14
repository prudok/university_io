import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/classroom_repository.dart';

@singleton
class ClassroomRepositoryImpl extends ClassroomRepository {
  ClassroomRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(ClassroomsCompanion classroom) async {
    await _db.into(_db.classrooms).insert(classroom);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteClassroom(id);
  }

  @override
  Future<List<Classroom>> getAll() {
    return _db.classroomsList;
  }
}
