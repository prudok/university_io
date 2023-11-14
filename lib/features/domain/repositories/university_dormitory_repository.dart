import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class UniversityDormitoriesRepository {
  Future<void> add(UniversityDormitoriesCompanion universityDormitory);

  Future<void> delete(int id);

  Future<List<UniversityDormitory>> getAll();
}
