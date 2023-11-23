import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/classroom/bloc/classroom_bloc.dart';
import 'package:university_io/features/presentation/classroom/widgets/classroom_list.dart';

@RoutePage()
class ClassroomView extends StatelessWidget {
  const ClassroomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClassroomBloc, ClassroomState>(
        builder: (_, state) {
          return switch (state) {
            final ClassroomInitial _ => const Center(child: CircularProgressIndicator()),
            final ClassroomLoading _ => const Center(child: CircularProgressIndicator()),
            final ClassroomFailed error => Center(child: Text(error.errorMessage)),
            final ClassroomLoaded state => state.classrooms.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      ClassroomList(classrooms: state.classrooms),
                    ],
                  )
                : const Center(child: Text('No Classrooms Found.')),
          };
        },
      ),
    );
  }
}
