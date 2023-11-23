part of 'classroom_bloc.dart';

@immutable
sealed class ClassroomState {}

final class ClassroomInitial extends ClassroomState {}

final class ClassroomLoading extends ClassroomState {}

final class ClassroomLoaded extends ClassroomState {
  ClassroomLoaded({required this.classrooms});

  final List<Classroom> classrooms;
}

final class ClassroomFailed extends ClassroomState {
  ClassroomFailed({required this.errorMessage});

  final String errorMessage;
}
