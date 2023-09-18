import 'package:bloc/bloc.dart';
import 'package:education_portal/features/data/datasource/databases/databases.dart';
import 'package:education_portal/features/data/teacher_repository/teacher_repository_impl.dart';
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
          await _updateTeachers();
      }
    });
  }
  final TeacherRepositoryImpl teacherRepositoryImpl;

  Future<void> _addTeacher(TeachersCompanion teacher, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherLoading());
      await teacherRepositoryImpl.add(teacher);
      await _updateTeachers().then(
        (teachers) => emit(TeacherLoaded(teachers: teachers)),
      );
    } on Object catch (error) {
      emit(TeacherFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeTeacher(int id, Emitter<TeacherState> emit) async {
    try {
      emit(TeacherLoading());
      await teacherRepositoryImpl.delete(id);
      await _updateTeachers().then(
        (teachers) => emit(TeacherLoaded(teachers: teachers)),
      );
    } on Object catch (error) {
      emit(TeacherFailed(errorMessage: error.toString()));
    }
  }

  Future<List<Teacher>> _updateTeachers() async {
    return teacherRepositoryImpl.getAll();
  }
}
