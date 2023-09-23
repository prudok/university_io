import 'package:education_portal/features/data/datasource/databases/university_db.dart';

abstract class StudentRepository {
  Future<void> add(StudentsCompanion student);
  Future<void> delete(int id);
  Future<Student> get(int id);
  Future<List<Student>> getAll();
}
