part of 'event_bloc.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventLoaded extends EventState {
  EventLoaded({required this.events});

  final List<Event> events;
}

final class EventFailed extends EventState {
  EventFailed({required this.errorMessage});

  final String errorMessage;
}
