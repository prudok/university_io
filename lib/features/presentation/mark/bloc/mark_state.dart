part of 'mark_bloc.dart';

@immutable
sealed class MarkState {}

final class MarkInitial extends MarkState {}

final class MarkLoading extends MarkState {}

final class MarkLoaded extends MarkState {
  MarkLoaded({required this.marks});

  final List<Mark> marks;
}

final class MarkFailed extends MarkState {
  MarkFailed({required this.errorMessage});

  final String errorMessage;
}
