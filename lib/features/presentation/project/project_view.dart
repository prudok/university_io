import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/project/bloc/project_bloc.dart';
import 'package:university_io/features/presentation/project/widgets/project_list.dart';

@RoutePage()
class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (_, state) {
          return switch (state) {
            final ProjectInitial _ => const Center(child: CircularProgressIndicator()),
            final ProjectLoading _ => const Center(child: CircularProgressIndicator()),
            final ProjectFailed error => Center(child: Text(error.errorMessage)),
            final ProjectLoaded state => state.projects.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      ProjectList(projects: state.projects),
                    ],
                  )
                : const Center(child: Text('No Projects Found.')),
          };
        },
      ),
    );
  }
}
