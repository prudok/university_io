part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class StudentAdd extends StudentEvent {
  StudentAdd({required this.student});

  final StudentsCompanion student;
}

class StudentRemove extends StudentEvent {
  StudentRemove({required this.id});

  final int id;
}

class StudentLoad extends StudentEvent {}
