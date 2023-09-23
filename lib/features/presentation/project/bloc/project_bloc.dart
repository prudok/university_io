import 'package:bloc/bloc.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/data/repositories_impl/project_repository_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'project_event.dart';
part 'project_state.dart';

@injectable
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc(this.projectRepositoryImpl) : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      switch (event) {
        case ProjectAdd():
          await _addProject(event.project, emit);
        case ProjectRemove():
          await _removeProject(event.id, emit);
        case ProjectLoad():
          await _updateProject(emit);
      }
    });
  }

  final ProjectRepositoryImpl projectRepositoryImpl;

  Future<void> _addProject(ProjectsCompanion project, Emitter<ProjectState> emit) async {
    try {
      emit(ProjectLoading());
      await projectRepositoryImpl.add(project);
      await _updateProject(emit);
    } on Object catch (error) {
      emit(ProjectFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeProject(int id, Emitter<ProjectState> emit) async {
    try {
      emit(ProjectLoading());
      await projectRepositoryImpl.delete(id);
      await _updateProject(emit);
    } on Object catch (error) {
      emit(ProjectFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateProject(Emitter<ProjectState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => projectRepositoryImpl.getAll().then(
            (projects) => emit(ProjectLoaded(projects: projects)),
          ),
    );
  }
}
