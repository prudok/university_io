part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class ProjectLoading extends ProjectState {}

final class ProjectLoaded extends ProjectState {
  ProjectLoaded({required this.projects});
  final List<Project> projects;
}

final class ProjectFailed extends ProjectState {
  ProjectFailed({required this.errorMessage});
  final String errorMessage;
}
