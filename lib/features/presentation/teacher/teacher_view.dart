import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:university_io/features/presentation/teacher/widgets/teacher_list.dart';

@RoutePage()
class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (_, state) {
          return switch (state) {
            final TeacherInitial _ => const Center(child: CircularProgressIndicator()),
            final TeacherLoading _ => const Center(child: CircularProgressIndicator()),
            final TeacherFailed error => Center(child: Text(error.errorMessage)),
            final TeacherLoaded state => state.teachers.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      TeacherList(teachers: state.teachers),
                    ],
                  )
                : const Center(child: Text('No Teachers Found.')),
          };
        },
      ),
    );
  }
}
