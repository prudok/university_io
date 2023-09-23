import 'package:education_portal/common/foundations/foundations.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:flutter/material.dart';

class DepartmentInfo extends StatelessWidget {
  const DepartmentInfo({required this.department, super.key});
  final Department department;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(department.name, style: Theme.of(context).textTheme.titleLarge),
        SpacingFoundation.horizontalSpaceSmall,
        const Text('Teacher Are Attached To This Department:'),
        SpacingFoundation.horizontalSpaceSmall,
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (_, index) => const ListTile(title: Text('Teacher')),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
