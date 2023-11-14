import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class EventRepository {
  Future<void> add(EventsCompanion event);
  Future<void> delete(int id);
  Future<List<Event>> getAll();
}
