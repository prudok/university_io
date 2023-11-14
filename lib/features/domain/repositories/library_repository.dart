import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class LibraryRepository {
  Future<void> add(LibrariesCompanion library);

  Future<void> delete(int id);

  Future<List<Library>> getAll();
}
