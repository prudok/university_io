import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class GTORepository {
  Future<void> add(GTOsCompanion gto);

  Future<void> delete(int id);

  Future<List<GTO>> getAll();
}
