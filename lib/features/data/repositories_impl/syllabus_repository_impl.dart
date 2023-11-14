import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class SyllabusRepositoryImpl extends SyllabusRepository {
  SyllabusRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(SyllabusCompanion syllabus) async {
    await _db.into(_db.syllabus).insert(syllabus);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteSyllabus(id);
  }

  @override
  Future<List<Syllabu>> getAll() {
    return _db.syllabusesList;
  }
}
