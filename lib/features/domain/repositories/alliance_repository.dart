import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class AllianceRepository {
  Future<void> add(AlliancesCompanion alliance);

  Future<void> delete(int id);

  Future<List<Alliance>> getAll();
}
