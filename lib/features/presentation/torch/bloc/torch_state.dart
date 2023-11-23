part of 'torch_bloc.dart';

@immutable
sealed class TorchState {}

final class TorchInitial extends TorchState {}

final class TorchLoading extends TorchState {}

final class TorchLoaded extends TorchState {
  TorchLoaded({required this.torches});

  final List<Torch> torches;
}

final class TorchFailed extends TorchState {
  TorchFailed({required this.errorMessage});

  final String errorMessage;
}
