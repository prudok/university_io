part of 'gto_bloc.dart';

@immutable
sealed class GTOState {}

final class GTOInitial extends GTOState {}

final class GTOLoading extends GTOState {}

final class GTOLoaded extends GTOState {
  GTOLoaded({required this.gtos});

  final List<GTO> gtos;
}

final class GTOFailed extends GTOState {
  GTOFailed({required this.errorMessage});

  final String errorMessage;
}
