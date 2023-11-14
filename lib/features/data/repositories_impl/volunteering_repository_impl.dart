import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class VolunteeringRepositoryImpl extends VolunteeringRepository {
  VolunteeringRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(VolunteeringCompanion volunteering) async {
    await _db.into(_db.volunteering).insert(volunteering);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteVolunteering(id);
  }

  @override
  Future<List<OVolunteering>> getAll() {
    return _db.volunteeringList;
  }
}
