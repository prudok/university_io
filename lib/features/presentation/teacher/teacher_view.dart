import 'package:auto_route/auto_route.dart';
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (_, state) {
          return switch (state) {
            TeacherInitial() => const Center(child: CircularProgressIndicator()),
            TeacherLoading() => const Center(child: CircularProgressIndicator()),
            TeacherFailed() => Center(child: Text(state.errorMessage)),
            TeacherLoaded() => const CustomScrollView(slivers: []),
          };
        },
      ),
    );
  }
}
