import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class VolunteeringRepository {
  Future<void> add(VolunteeringCompanion volunteering);

  Future<void> delete(int id);

  Future<List<OVolunteering>> getAll();
}
