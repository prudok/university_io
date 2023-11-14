import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class MarkRepository {
  Future<void> add(MarksCompanion mark);

  Future<void> delete(int id);

  Future<List<Mark>> getAll();
}
