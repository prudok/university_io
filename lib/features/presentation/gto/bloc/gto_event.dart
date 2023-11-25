part of 'gto_bloc.dart';

@immutable
sealed class GTOEvent {}

class GTOAdd extends GTOEvent {
  GTOAdd({required this.gto});

  final GTOsCompanion gto;
}

class GTORemove extends GTOEvent {
  GTORemove({required this.id});

  final int id;
}

class GTOLoad extends GTOEvent {}
