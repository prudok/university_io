import 'package:auto_route/auto_route.dart';
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherBloc = BlocProvider.of<TeacherBloc>(context);

    return Scaffold(
      body: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (_, state) {
          return switch (state) {
            TeacherInitial() => const Center(child: CircularProgressIndicator()),
            TeacherLoading() => const Center(child: CircularProgressIndicator()),
            TeacherFailed() => Center(child: Text(state.errorMessage)),
            TeacherLoaded() => CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: state.teachers.length,
                    itemBuilder: (_, index) {
                      final teacher = state.teachers[index];
                      return ListTile(
                        leading: const Icon(Icons.people, size: 15),
                        title: Text(teacher.firstName),
                        subtitle: Row(
                          children: [
                            Text('${teacher.lastName}, '),
                            if (teacher.gender != null) Text(teacher.gender!),
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
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
