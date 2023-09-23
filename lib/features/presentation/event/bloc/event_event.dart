part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class EventAdd extends EventEvent {
  EventAdd({required this.event});

  final EventsCompanion event;
}

class EventRemove extends EventEvent {
  EventRemove({required this.id});

  final int id;
}

class EventLoad extends EventEvent {}
