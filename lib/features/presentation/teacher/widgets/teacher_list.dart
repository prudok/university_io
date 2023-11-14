import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/teacher/bloc/teacher_bloc.dart';

class TeacherList extends StatelessWidget {
  const TeacherList({required this.teachers, super.key});

  final List<Teacher> teachers;

  @override
  Widget build(BuildContext context) {
    final teacherBloc = BlocProvider.of<TeacherBloc>(context);

    return SliverList.separated(
      itemCount: teachers.length,
      itemBuilder: (_, index) {
        final teacher = teachers[index];

        return ListTile(
          leading: const Icon(Icons.emoji_people, size: 35),
          title: Text(teacher.firstName),
          subtitle: Row(
            children: [
              Text('${teacher.lastName}, '),
              Text(teacher.gender),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => teacherBloc.add(TeacherRemove(id: teacher.id)),
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
