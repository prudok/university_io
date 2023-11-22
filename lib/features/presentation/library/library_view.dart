import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/library/bloc/library_bloc.dart';
import 'package:university_io/features/presentation/library/widgets/library_list.dart';

@RoutePage()
class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (_, state) {
          return switch (state) {
            final LibraryInitial _ => const Center(child: CircularProgressIndicator()),
            final LibraryLoading _ => const Center(child: CircularProgressIndicator()),
            final LibraryFailed error => Center(child: Text(error.errorMessage)),
            final LibraryLoaded state => state.libraries.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      LibraryList(libraries: state.libraries),
                    ],
                  )
                : const Center(child: Text('No Librarys Found.')),
          };
        },
      ),
    );
  }
}
