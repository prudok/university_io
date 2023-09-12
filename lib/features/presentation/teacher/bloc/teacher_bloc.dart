import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:education_portal/features/domain/entities/teacher.dart';
import 'package:meta/meta.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc() : super(TeacherInitial()) {
    on<TeacherEvent>((event, emit) {
      switch (event) {
        case TeacherAdd():
          _addTeacher(event.teacher, emit);
        case TeacherRemove():
          _removeTeacher(event.id, emit);
      }
    });
  }
  void _addTeacher(Teacher teacher, Emitter<TeacherState> emit) {
    try {
      emit(TeacherLoading());
      emit(TeacherLoaded(teachers: const []));
    } on Object catch (error) {
      emit(TeacherFailed(errorMessage: error.toString()));
    }
  }

  void _removeTeacher(int id, Emitter<TeacherState> emit) {}
}
