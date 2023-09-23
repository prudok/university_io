part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class ProjectAdd extends ProjectEvent {
  ProjectAdd({required this.project});
  final ProjectsCompanion project;
}

class ProjectRemove extends ProjectEvent {
  ProjectRemove({required this.id});
  final int id;
}

class ProjectLoad extends ProjectEvent {}
