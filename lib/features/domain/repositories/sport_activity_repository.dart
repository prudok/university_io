import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class SportActivityRepository {
  Future<void> add(SportActivitiesCompanion sportActivity);

  Future<void> delete(int id);

  Future<List<SportActivity>> getAll();
}
