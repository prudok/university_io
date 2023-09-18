import 'package:education_portal/features/data/datasource/databases/databases.dart';

abstract class TeacherRepository {
  Future<void> add(TeachersCompanion teacher);
  Future<void> delete(int id);
  Future<Teacher> get(int id);
  Future<List<Teacher>> getAll();
}
