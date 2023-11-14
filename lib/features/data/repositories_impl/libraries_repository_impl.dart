import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/repositories.dart';

@singleton
class LibraryRepositoryImpl extends LibraryRepository {
  LibraryRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(LibrariesCompanion library) async {
    await _db.into(_db.libraries).insert(library);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteLibrary(id);
  }

  @override
  Future<List<Library>> getAll() {
    return _db.librariesList;
  }
}
