import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/data/repositories_impl/repositories_impl.dart';

part 'library_event.dart';
part 'library_state.dart';

@injectable
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc(this.libraryRepositoryImpl) : super(LibraryInitial()) {
    on<LibraryEvent>((event, emit) async {
      switch (event) {
        case LibraryAdd():
          await _addLibrary(event.library, emit);
        case LibraryRemove():
          await _removeLibrary(event.id, emit);
        case LibraryLoad():
          await _updateLibrary(emit);
      }
    });
  }

  final LibraryRepositoryImpl libraryRepositoryImpl;

  Future<void> _addLibrary(LibrariesCompanion library, Emitter<LibraryState> emit) async {
    try {
      emit(LibraryLoading());
      await libraryRepositoryImpl.add(library);
      await _updateLibrary(emit);
    } on Object catch (error) {
      emit(LibraryFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeLibrary(int id, Emitter<LibraryState> emit) async {
    try {
      emit(LibraryLoading());
      await libraryRepositoryImpl.delete(id);
      await _updateLibrary(emit);
    } on Object catch (error) {
      emit(LibraryFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateLibrary(Emitter<LibraryState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => libraryRepositoryImpl.getAll().then(
            (libraries) => emit(LibraryLoaded(libraries: libraries)),
          ),
    );
  }
}
