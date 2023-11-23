import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'torch_event.dart';
part 'torch_state.dart';

@injectable
class TorchBloc extends Bloc<TorchEvent, TorchState> {
  TorchBloc(this.torchRepositoryImpl) : super(TorchInitial()) {
    on<TorchEvent>((event, emit) async {
      switch (event) {
        case TorchAdd():
          await _addTorch(event.torch, emit);
        case TorchRemove():
          await _removeTorch(event.id, emit);
        case TorchLoad():
          await _updateTorch(emit);
      }
    });
  }

  final TorchesRepositoryImpl torchRepositoryImpl;

  Future<void> _addTorch(TorchesCompanion torch, Emitter<TorchState> emit) async {
    try {
      emit(TorchLoading());
      await torchRepositoryImpl.add(torch);
      await _updateTorch(emit);
    } on Object catch (error) {
      emit(TorchFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeTorch(int id, Emitter<TorchState> emit) async {
    try {
      emit(TorchLoading());
      await torchRepositoryImpl.delete(id);
      await _updateTorch(emit);
    } on Object catch (error) {
      emit(TorchFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateTorch(Emitter<TorchState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => torchRepositoryImpl.getAll().then(
            (torchs) => emit(TorchLoaded(torches: torchs)),
          ),
    );
  }
}
