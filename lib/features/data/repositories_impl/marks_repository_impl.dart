import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class MarkRepositoryImpl extends MarkRepository {
  MarkRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(MarksCompanion mark) async {
    await _db.into(_db.marks).insert(mark);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteMark(id);
  }

  @override
  Future<List<Mark>> getAll() {
    return _db.marksList;
  }
}
