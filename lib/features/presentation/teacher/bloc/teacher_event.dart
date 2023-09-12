part of 'teacher_bloc.dart';

@immutable
sealed class TeacherEvent {}

class TeacherAdd extends TeacherEvent {
  TeacherAdd({required this.teacher});

  final Teacher teacher;
}

class TeacherRemove extends TeacherEvent {
  TeacherRemove({required this.id});

  final int id;
}
