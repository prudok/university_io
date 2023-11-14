import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class SyllabusRepository {
  Future<void> add(SyllabusCompanion syllabus);

  Future<void> delete(int id);

  Future<List<Syllabu>> getAll();
}
