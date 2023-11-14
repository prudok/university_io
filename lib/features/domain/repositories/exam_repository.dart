import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class ExamRepository {
  Future<void> add(ExamsCompanion exam);

  Future<void> delete(int id);

  Future<List<Exam>> getAll();
}
