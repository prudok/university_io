part of 'mark_bloc.dart';

@immutable
sealed class MarkEvent {}

class MarkAdd extends MarkEvent {
  MarkAdd({required this.mark});

  final MarksCompanion mark;
}

class MarkRemove extends MarkEvent {
  MarkRemove({required this.id});

  final int id;
}

class MarkLoad extends MarkEvent {}
