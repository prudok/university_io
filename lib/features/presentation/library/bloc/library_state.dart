part of 'library_bloc.dart';

@immutable
sealed class LibraryState {}

final class LibraryInitial extends LibraryState {}

final class LibraryLoading extends LibraryState {}

final class LibraryLoaded extends LibraryState {
  LibraryLoaded({required this.libraries});

  final List<Library> libraries;
}

final class LibraryFailed extends LibraryState {
  LibraryFailed({required this.errorMessage});

  final String errorMessage;
}
