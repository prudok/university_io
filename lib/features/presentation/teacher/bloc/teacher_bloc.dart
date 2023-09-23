import 'package:bloc/bloc.dart';
import 'package:education_portal/features/data/datasource/databases/university_db.dart';
import 'package:education_portal/features/data/repositories_impl/teacher_repository_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

@injectable
class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc(this.teacherRepositoryImpl) : super(TeacherInitial()) {
    on<TeacherEvent>((event, emit) async {
      switch (event) {
        case TeacherAdd():
          await _addTeacher(event.teacher, emit);
        case TeacherRemove():
          await _removeTeacher(event.id, emit);
        case TeacherLoad():
          await _updateTeachers(emit);
      }
    });
  }

  final TeacherRepositoryImpl teacherRepositoryImpl;

  Future<void> _addTeacher(TeachersCompanion teacher, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherLoading());
      await teacherRepositoryImpl.add(teacher);
      await _updateTeachers(emit);
    } on Object catch (error) {
      emit(TeacherFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeTeacher(int id, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherLoading());
      await teacherRepositoryImpl.delete(id);
      await _updateTeachers(emit);
    } on Object catch (error) {
      emit(TeacherFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateTeachers(Emitter<TeacherState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => teacherRepositoryImpl.getAll().then(
            (teachers) => emit(TeacherLoaded(teachers: teachers)),
          ),
    );
  }
}
