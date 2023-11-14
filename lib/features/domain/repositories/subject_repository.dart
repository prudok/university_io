import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class SubjectRepository {
  Future<void> add(SubjectsCompanion subject);

  Future<void> delete(int id);

  Future<List<Subject>> getAll();
}
