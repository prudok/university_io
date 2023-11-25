import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/gto/bloc/gto_bloc.dart';
import 'package:university_io/features/presentation/gto/widgets/gto_list.dart';

@RoutePage()
class GTOView extends StatelessWidget {
  const GTOView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GTOBloc, GTOState>(
        builder: (_, state) {
          return switch (state) {
            final GTOInitial _ =>
              const Center(child: CircularProgressIndicator()),
            final GTOLoading _ =>
              const Center(child: CircularProgressIndicator()),
            final GTOFailed error => Center(child: Text(error.errorMessage)),
            final GTOLoaded state => state.gtos.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      GTOList(gtos: state.gtos),
                    ],
                  )
                : const Center(child: Text('No GTOs Found.')),
          };
        },
      ),
    );
  }
}
