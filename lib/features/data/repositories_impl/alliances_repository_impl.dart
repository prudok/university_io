import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class AllianceRepositoryImpl extends AllianceRepository {
  AllianceRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(AlliancesCompanion alliance) async {
    await _db.into(_db.alliances).insert(alliance);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteAlliance(id);
  }

  @override
  Future<List<Alliance>> getAll() {
    return _db.alliancesList;
  }
}
