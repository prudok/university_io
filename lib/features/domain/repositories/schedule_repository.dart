import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class ScheduleRepository {
  Future<void> add(SchedulesCompanion schedule);

  Future<void> delete(int id);

  Future<List<Schedule>> getAll();
}
