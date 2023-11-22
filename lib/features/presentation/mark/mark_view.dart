import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/mark/bloc/mark_bloc.dart';
import 'package:university_io/features/presentation/mark/widgets/mark_list.dart';

@RoutePage()
class MarkView extends StatelessWidget {
  const MarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MarkBloc, MarkState>(
        builder: (_, state) {
          return switch (state) {
            final MarkInitial _ => const Center(child: CircularProgressIndicator()),
            final MarkLoading _ => const Center(child: CircularProgressIndicator()),
            final MarkFailed error => Center(child: Text(error.errorMessage)),
            final MarkLoaded state => state.marks.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      MarkList(marks: state.marks),
                    ],
                  )
                : const Center(child: Text('No Marks Found.')),
          };
        },
      ),
    );
  }
}
