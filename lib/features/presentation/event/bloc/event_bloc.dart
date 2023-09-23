import 'package:bloc/bloc.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/data/repositories_impl/event_repository_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'event_event.dart';
part 'event_state.dart';

@injectable
class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc(this.eventRepositoryImpl) : super(EventInitial()) {
    on<EventEvent>((event, emit) async {
      switch (event) {
        case EventAdd():
          await _addEvent(event.event, emit);
        case EventRemove():
          await _removeEvent(event.id, emit);
        case EventLoad():
          await _updateEvent(emit);
      }
    });
  }

  final EventRepositoryImpl eventRepositoryImpl;

  Future<void> _addEvent(EventsCompanion event, Emitter<EventState> emit) async {
    try {
      emit(EventLoading());
      await eventRepositoryImpl.add(event);
      await _updateEvent(emit);
    } on Object catch (error) {
      emit(EventFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _removeEvent(int id, Emitter<EventState> emit) async {
    try {
      emit(EventLoading());
      await eventRepositoryImpl.delete(id);
      await _updateEvent(emit);
    } on Object catch (error) {
      emit(EventFailed(errorMessage: error.toString()));
    }
  }

  Future<void> _updateEvent(Emitter<EventState> emit) async {
    return Future<void>.delayed(const Duration(seconds: 1)).then(
      (_) => eventRepositoryImpl.getAll().then(
            (events) => emit(EventLoaded(events: events)),
          ),
    );
  }
}
