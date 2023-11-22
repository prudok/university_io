import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'mark_event.dart';
part 'mark_state.dart';

@injectable
class MarkBloc extends Bloc<MarkEvent, MarkState> {
  MarkBloc(this.markRepositoryImpl) : super(MarkInitial()) {
    on<MarkEvent>((event, emit) async {
      switch (event) {
        case MarkAdd():
          await _addMark(event.mark, emit);
        case MarkRemove():
          await _removeMark(event.id, emit);
        case MarkLoad():
          await _updateMark(emit);
      }
    });
  }

  final MarkRepositoryImpl markRepositoryImpl;

  Future<void> _addMark(MarksCompanion mark, Emitter<MarkState> emit) async {
    try {
      emit(MarkLoading());
      await markRepositoryImpl.add(mark);
      await _updateMark(emit);
    } on Object catch (error) {
      emit(MarkFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeMark(int id, Emitter<MarkState> emit) async {
    try {
      emit(MarkLoading());
      await markRepositoryImpl.delete(id);
      await _updateMark(emit);
    } on Object catch (error) {
      emit(MarkFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateMark(Emitter<MarkState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => markRepositoryImpl.getAll().then(
            (marks) => emit(MarkLoaded(marks: marks)),
          ),
    );
  }
}
