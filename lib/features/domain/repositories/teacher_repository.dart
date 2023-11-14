import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class TeacherRepository {
  Future<void> add(TeachersCompanion teacher);
  Future<void> delete(int id);
  Future<List<Teacher>> getAll();
}
