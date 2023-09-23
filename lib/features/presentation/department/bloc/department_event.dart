part of 'department_bloc.dart';

@immutable
sealed class DepartmentEvent {}

class DepartmentAdd extends DepartmentEvent {
  DepartmentAdd({required this.department});

  final DepartmentsCompanion department;
}

class DepartmentRemove extends DepartmentEvent {
  DepartmentRemove({required this.id});
  final int id;
}

class DepartmentLoad extends DepartmentEvent {}
