import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/project/bloc/project_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final projectBloc = BlocProvider.of<ProjectBloc>(context);

    return SliverList.separated(
      itemCount: projects.length,
      itemBuilder: (_, index) {
        final project = projects[index];

        return ListTile(
          leading: const Icon(CupertinoIcons.table, size: 35),
          title: Text(project.title),
          subtitle: Row(
            children: [
              Text(project.description),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => projectBloc.add(ProjectRemove(id: project.id)),
                icon: const Icon(Icons.remove, size: 15),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
