import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'department_event.dart';
part 'department_state.dart';

@injectable
class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc(this.departmentRepositoryImpl) : super(DepartmentInitial()) {
    on<DepartmentEvent>((event, emit) async {
      switch (event) {
        case DepartmentAdd():
          await _addDepartment(event.department, emit);
        case DepartmentRemove():
          await _removeDepartment(event.id, emit);
        case DepartmentLoad():
          await _updateDepartment(emit);
      }
    });
  }

  final DepartmentRepositoryImpl departmentRepositoryImpl;

  Future<void> _addDepartment(DepartmentsCompanion department, Emitter<DepartmentState> emit) async {
    try {
      emit(DepartmentLoading());
      await departmentRepositoryImpl.add(department);
      await _updateDepartment(emit);
    } on Object catch (error) {
      emit(DepartmentFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeDepartment(int id, Emitter<DepartmentState> emit) async {
    try {
      emit(DepartmentLoading());
      await departmentRepositoryImpl.delete(id);
      await _updateDepartment(emit);
    } on Object catch (error) {
      emit(DepartmentFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateDepartment(Emitter<DepartmentState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => departmentRepositoryImpl.getAll().then(
            (departments) => emit(DepartmentLoaded(departments: departments)),
          ),
    );
  }
}
