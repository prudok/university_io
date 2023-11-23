import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/spacing_foundation.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/classroom/bloc/classroom_bloc.dart';

class ClassroomList extends StatelessWidget {
  const ClassroomList({required this.classrooms, super.key});

  final List<Classroom> classrooms;

  @override
  Widget build(BuildContext context) {
    final classroomBloc = BlocProvider.of<ClassroomBloc>(context);

    return SliverList.separated(
      itemCount: classrooms.length,
      itemBuilder: (_, index) {
        final classroom = classrooms[index];

        return ListTile(
          leading: const Icon(Icons.home_mini, size: 35),
          title: Text('Classroom ID: ${classroom.id}'),
          subtitle: Row(
            children: [
              Text('Building: ${classroom.building}, '),
              SpacingFoundation.horizontalSpaceSmall,
              Text('Capacity: ${classroom.capacity}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => classroomBloc.add(ClassroomRemove(id: classroom.id)),
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
