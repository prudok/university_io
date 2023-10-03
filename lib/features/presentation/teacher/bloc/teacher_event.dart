part of 'teacher_bloc.dart';

@immutable
sealed class TeacherEvent {}

class TeacherAdd extends TeacherEvent {
  TeacherAdd({required this.teacher, required this.department});

  final TeachersCompanion teacher;
  final DepartmentTeacherLinksCompanion department;
}

class TeacherRemove extends TeacherEvent {
  TeacherRemove({required this.id});

  final int id;
}

class TeacherLoad extends TeacherEvent {}
