part of 'book_bloc.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookLoaded extends BookState {
  BookLoaded({required this.books});

  final List<Book> books;
}

final class BookFailed extends BookState {
  BookFailed({required this.errorMessage});

  final String errorMessage;
}
