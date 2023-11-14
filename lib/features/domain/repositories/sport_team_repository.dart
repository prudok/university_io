import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class SportTeamsRepository {
  Future<void> add(SportTeamsCompanion sportTeam);

  Future<void> delete(int id);

  Future<List<SportTeam>> getAll();
}
