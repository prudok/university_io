import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(NewsCompanion news) async {
    await _db.into(_db.news).insert(news);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteONews(id);
  }

  @override
  Future<List<ONews>> getAll() {
    return _db.newsList;
  }
}
