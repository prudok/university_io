import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class TorchesRepositoryImpl extends TorchesRepository {
  TorchesRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(TorchesCompanion torch) async {
    await _db.into(_db.torches).insert(torch);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteTorch(id);
  }

  @override
  Future<List<Torch>> getAll() {
    return _db.torchesList;
  }
}
