import 'package:education_portal/features/domain/entities/teacher.dart';

abstract class TeacherRepository {
  Future<void> add(Teacher teacher);
  Future<void> delete(int id);
}
