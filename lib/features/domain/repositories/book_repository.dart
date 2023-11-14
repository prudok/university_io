import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class BookRepository {
  Future<void> add(BooksCompanion book);

  Future<void> delete(int id);

  Future<List<Book>> getAll();
}
