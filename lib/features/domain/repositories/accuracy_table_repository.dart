import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class AccuracyTableRepository {
  Future<void> add(AccuracyTablesCompanion accuracyTable);

  Future<void> delete(int id);

  Future<List<AccuracyTable>> getAll();
}
