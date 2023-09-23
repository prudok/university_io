import 'package:education_portal/common/foundations/border_radius_foundation.dart';
import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/department/widgets/department_info.dart';
import 'package:flutter/material.dart';

class DepartmentGrid extends StatelessWidget {
  const DepartmentGrid({required this.departments, super.key});
  final List<Department> departments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 950 ? 6 : 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 135,
            ),
            itemCount: departments.length,
            itemBuilder: (_, int index) {
              return GestureDetector(
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: ConstrainedBox(
                      constraints: const BoxConstraints.expand(width: 300),
                      child: DepartmentInfo(department: departments[index]),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusFoundation.all20,
                            color: Colors.white,
                          ),
                          child: Center(child: Text('${departments[index].id}')),
                        ),
                      ),
                    ),
                    SpacingFoundation.verticalSpaceSmall,
                    Text(departments[index].name),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
