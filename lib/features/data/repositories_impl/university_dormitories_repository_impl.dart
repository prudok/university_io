import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class UniversityDormitoryRepositoryImpl extends UniversityDormitoriesRepository {
  UniversityDormitoryRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(UniversityDormitoriesCompanion universityDormitory) async {
    await _db.into(_db.universityDormitories).insert(universityDormitory);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteUniversityDormitory(id);
  }

  @override
  Future<List<UniversityDormitory>> getAll() {
    return _db.universityDormitoriesList;
  }
}
