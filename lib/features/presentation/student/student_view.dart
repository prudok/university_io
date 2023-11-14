import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/student/bloc/student_bloc.dart';
import 'package:university_io/features/presentation/student/widgets/student_list.dart';

@RoutePage()
class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (_, state) {
          return switch (state) {
            final StudentInitial _ => const Center(child: CircularProgressIndicator()),
            final StudentLoading _ => const Center(child: CircularProgressIndicator()),
            final StudentFailed error => Center(child: Text(error.errorMessage)),
            final StudentLoaded state => state.students.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      StudentList(students: state.students),
                    ],
                  )
                : const Center(child: Text('No Students Found.')),
          };
        },
      ),
    );
  }
}
