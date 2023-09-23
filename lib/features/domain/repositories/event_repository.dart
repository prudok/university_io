import 'package:education_portal/features/data/datasource/databases/university_db.dart';

abstract class EventRepository {
  Future<void> add(EventsCompanion event);
  Future<void> delete(int id);
  Future<Event> get(int id);
  Future<List<Event>> getAll();
}
