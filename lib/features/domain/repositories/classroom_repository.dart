import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class ClassroomRepository {
  Future<void> add(ClassroomsCompanion classroom);

  Future<void> delete(int id);

  Future<List<Classroom>> getAll();
}
