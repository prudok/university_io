part of 'teacher_bloc.dart';

@immutable
sealed class TeacherState {}

final class TeacherInitial extends TeacherState {}

final class TeacherLoading extends TeacherState {}

final class TeacherLoaded extends TeacherState {
  TeacherLoaded({required this.teachers});

  final List<Teacher> teachers;
}

final class TeacherFailed extends TeacherState {
  TeacherFailed({required this.errorMessage});

  final String errorMessage;
}
