import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class TypeOfActivityRepository {
  Future<void> add(TypesOfActivitiesCompanion typeOfActivity);

  Future<List<TypeOfActivity>> getAll();
}
