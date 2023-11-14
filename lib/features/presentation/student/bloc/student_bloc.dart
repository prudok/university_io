import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'student_event.dart';
part 'student_state.dart';

@injectable
class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc(this.studentRepositoryImpl) : super(StudentInitial()) {
    on<StudentEvent>((event, emit) async {
      switch (event) {
        case StudentAdd():
          await _addStudent(event.student, emit);
        case StudentRemove():
          await _removeStudent(event.id, emit);
        case StudentLoad():
          await _updateStudent(emit);
      }
    });
  }

  final StudentRepositoryImpl studentRepositoryImpl;

  Future<void> _addStudent(StudentsCompanion student, Emitter<StudentState> emit) async {
    try {
      emit(StudentLoading());
      await studentRepositoryImpl.add(student);
      await _updateStudent(emit);
    } on Object catch (error) {
      emit(StudentFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeStudent(int id, Emitter<StudentState> emit) async {
    try {
      emit(StudentLoading());
      await studentRepositoryImpl.delete(id);
      await _updateStudent(emit);
    } on Object catch (error) {
      emit(StudentFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateStudent(Emitter<StudentState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => studentRepositoryImpl.getAll().then(
            (students) => emit(StudentLoaded(students: students)),
          ),
    );
  }
}
