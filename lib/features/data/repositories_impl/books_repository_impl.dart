import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/domain/repositories/book_repository.dart';

@singleton
class BookRepositoryImpl extends BookRepository {
  BookRepositoryImpl({required UniversityDatabase db}) : _db = db;

  final UniversityDatabase _db;

  @override
  Future<void> add(BooksCompanion book) async {
    await _db.into(_db.books).insert(book);
  }

  @override
  Future<void> delete(int id) async {
    await _db.deleteBook(id);
  }

  @override
  Future<List<Book>> getAll() {
    return _db.booksList;
  }
}
