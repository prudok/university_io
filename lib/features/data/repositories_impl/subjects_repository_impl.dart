import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class SubjectRepositoryImpl extends SubjectRepository {
  SubjectRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(SubjectsCompanion subject) async {
    await _db.into(_db.subjects).insert(subject);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteSubject(id);
  }

  @override
  Future<List<Subject>> getAll() {
    return _db.subjectsList;
  }
}
