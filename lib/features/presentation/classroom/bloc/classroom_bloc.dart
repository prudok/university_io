import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';

@injectable
class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  ClassroomBloc(this.classroomRepositoryImpl) : super(ClassroomInitial()) {
    on<ClassroomEvent>((event, emit) async {
      switch (event) {
        case ClassroomAdd():
          await _addClassroom(event.classroom, emit);
        case ClassroomRemove():
          await _removeClassroom(event.id, emit);
        case ClassroomLoad():
          await _updateClassrooms(emit);
      }
    });
  }

  final ClassroomRepositoryImpl classroomRepositoryImpl;

  Future<void> _addClassroom(ClassroomsCompanion classroom, Emitter<ClassroomState> emit) async {
    try {
      emit(ClassroomLoading());
      await classroomRepositoryImpl.add(classroom);
      await _updateClassrooms(emit);
    } on Object catch (error) {
      emit(ClassroomFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeClassroom(int id, Emitter<ClassroomState> emit) async {
    try {
      emit(ClassroomLoading());
      await classroomRepositoryImpl.delete(id);
      await _updateClassrooms(emit);
    } on Object catch (error) {
      emit(ClassroomFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateClassrooms(Emitter<ClassroomState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => classroomRepositoryImpl.getAll().then(
            (classrooms) => emit(ClassroomLoaded(classrooms: classrooms)),
          ),
    );
  }
}
