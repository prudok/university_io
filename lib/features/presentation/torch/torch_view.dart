import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/torch/bloc/torch_bloc.dart';
import 'package:university_io/features/presentation/torch/widgets/torch_list.dart';

@RoutePage()
class TorchView extends StatelessWidget {
  const TorchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TorchBloc, TorchState>(
        builder: (_, state) {
          return switch (state) {
            final TorchInitial _ => const Center(child: CircularProgressIndicator()),
            final TorchLoading _ => const Center(child: CircularProgressIndicator()),
            final TorchFailed error => Center(child: Text(error.errorMessage)),
            final TorchLoaded state => state.torches.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      TorchList(torches: state.torches),
                    ],
                  )
                : const Center(child: Text('No Torches Found.')),
          };
        },
      ),
    );
  }
}
