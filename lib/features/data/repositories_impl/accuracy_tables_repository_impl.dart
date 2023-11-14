import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class AccuracyTableRepositoryImpl extends AccuracyTableRepository {
  AccuracyTableRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(AccuracyTablesCompanion accuracyTable) async {
    await _db.into(_db.accuracyTables).insert(accuracyTable);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteAccuracyTable(id);
  }

  @override
  Future<List<AccuracyTable>> getAll() {
    return _db.accuracyTablesList;
  }
}
