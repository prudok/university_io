import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class StudentRepository {
  Future<void> add(StudentsCompanion student);
  Future<void> delete(int id);
  Future<List<Student>> getAll();
}
