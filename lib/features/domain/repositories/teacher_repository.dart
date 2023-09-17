import 'package:education_portal/features/domain/entities/teacher.dart';

abstract class TeacherRepository {
  Future<void> add(Teacher teacher);
  Future<void> delete(int id);
  Future<Teacher> get(int id);
  Future<List<Teacher>> getAll();
}
