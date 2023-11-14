import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class TorchesRepository {
  Future<void> add(TorchesCompanion torch);

  Future<void> delete(int id);

  Future<List<Torch>> getAll();
}
