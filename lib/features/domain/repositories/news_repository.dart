import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class NewsRepository {
  Future<void> add(NewsCompanion news);

  Future<void> delete(int id);

  Future<List<ONews>> getAll();
}
