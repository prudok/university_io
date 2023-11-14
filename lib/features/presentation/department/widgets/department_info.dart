import 'package:flutter/material.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';

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
