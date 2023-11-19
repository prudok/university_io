part of 'book_bloc.dart';

@immutable
sealed class BookEvent {}

class BookAdd extends BookEvent {
  BookAdd({required this.book});

  final BooksCompanion book;
}

class BookRemove extends BookEvent {
  BookRemove({required this.id});

  final int id;
}

class BookLoad extends BookEvent {}
