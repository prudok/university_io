import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'book_event.dart';
part 'book_state.dart';

@injectable
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(this.bookRepositoryImpl) : super(BookInitial()) {
    on<BookEvent>((event, emit) async {
      switch (event) {
        case BookAdd():
          await _addBook(event.book, emit);
        case BookRemove():
          await _removeBook(event.id, emit);
        case BookLoad():
          await _updateBook(emit);
      }
    });
  }

  final BookRepositoryImpl bookRepositoryImpl;

  Future<void> _addBook(BooksCompanion book, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      await bookRepositoryImpl.add(book);
      await _updateBook(emit);
    } on Object catch (error) {
      emit(BookFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeBook(int id, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      await bookRepositoryImpl.delete(id);
      await _updateBook(emit);
    } on Object catch (error) {
      emit(BookFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateBook(Emitter<BookState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => bookRepositoryImpl.getAll().then(
            (books) => emit(BookLoaded(books: books)),
          ),
    );
  }
}
