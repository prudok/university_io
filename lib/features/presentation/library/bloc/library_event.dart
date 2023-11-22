part of 'library_bloc.dart';

@immutable
sealed class LibraryEvent {}

class LibraryAdd extends LibraryEvent {
  LibraryAdd({required this.library});

  final LibrariesCompanion library;
}

class LibraryRemove extends LibraryEvent {
  LibraryRemove({required this.id});

  final int id;
}

class LibraryLoad extends LibraryEvent {}
