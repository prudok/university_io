import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'gto_event.dart';
part 'gto_state.dart';

@injectable
class GTOBloc extends Bloc<GTOEvent, GTOState> {
  GTOBloc(this.gtoRepositoryImpl) : super(GTOInitial()) {
    on<GTOEvent>((event, emit) async {
      switch (event) {
        case GTOAdd():
          await _addGTO(event.gto, emit);
        case GTORemove():
          await _removeGTO(event.id, emit);
        case GTOLoad():
          await _updateGTO(emit);
      }
    });
  }

  final GTORepositoryImpl gtoRepositoryImpl;

  Future<void> _addGTO(GTOsCompanion gto, Emitter<GTOState> emit) async {
    try {
      emit(GTOLoading());
      await gtoRepositoryImpl.add(gto);
      await _updateGTO(emit);
    } on Object catch (error) {
      emit(GTOFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeGTO(int id, Emitter<GTOState> emit) async {
    try {
      emit(GTOLoading());
      await gtoRepositoryImpl.delete(id);
      await _updateGTO(emit);
    } on Object catch (error) {
      emit(GTOFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateGTO(Emitter<GTOState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => gtoRepositoryImpl.getAll().then(
            (gtos) => emit(GTOLoaded(gtos: gtos)),
          ),
    );
  }
}
