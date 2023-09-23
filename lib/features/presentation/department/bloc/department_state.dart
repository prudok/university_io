part of 'department_bloc.dart';

@immutable
sealed class DepartmentState {}

final class DepartmentInitial extends DepartmentState {}

final class DepartmentLoading extends DepartmentState {}

final class DepartmentLoaded extends DepartmentState {
  DepartmentLoaded({required this.departments});

  final List<Department> departments;
}

final class DepartmentFailed extends DepartmentState {
  DepartmentFailed({required this.errorMessage});
  final String errorMessage;
}
