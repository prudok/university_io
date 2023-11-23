part of 'torch_bloc.dart';

@immutable
sealed class TorchEvent {}

class TorchAdd extends TorchEvent {
  TorchAdd({required this.torch});

  final TorchesCompanion torch;
}

class TorchRemove extends TorchEvent {
  TorchRemove({required this.id});

  final int id;
}

class TorchLoad extends TorchEvent {}
