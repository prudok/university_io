import 'package:auto_route/auto_route.dart';
import 'package:education_portal/features/presentation/department/bloc/department_bloc.dart';
import 'package:education_portal/features/presentation/department/widgets/department_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DepartmentView extends StatelessWidget {
  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DepartmentBloc, DepartmentState>(
        builder: (_, state) {
          return switch (state) {
            final DepartmentInitial _ => const Center(child: CircularProgressIndicator()),
            final DepartmentLoading _ => const Center(child: CircularProgressIndicator()),
            final DepartmentFailed error => Center(child: Text(error.errorMessage)),
            final DepartmentLoaded state => state.departments.isNotEmpty
                ? DepartmentGrid(departments: state.departments)
                : const Center(child: Text('No Departments Found.')),
          };
        },
      ),
    );
  }
}
