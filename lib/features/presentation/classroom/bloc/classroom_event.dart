part of 'classroom_bloc.dart';

@immutable
sealed class ClassroomEvent {}

class ClassroomAdd extends ClassroomEvent {
  ClassroomAdd({required this.classroom});

  final ClassroomsCompanion classroom;
}

class ClassroomRemove extends ClassroomEvent {
  ClassroomRemove({required this.id});

  final int id;
}

class ClassroomLoad extends ClassroomEvent {}
