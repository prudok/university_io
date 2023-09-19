part of 'student_bloc.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentLoaded extends StudentState {
  StudentLoaded({required this.students});

  final List<Student> students;
}

final class StudentFailed extends StudentState {
  StudentFailed({required this.errorMessage});

  final String errorMessage;
}
