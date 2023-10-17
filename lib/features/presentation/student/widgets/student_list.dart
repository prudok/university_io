import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/student/bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentList extends StatelessWidget {
  const StudentList({required this.students, super.key});

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    final studentBloc = BlocProvider.of<StudentBloc>(context);

    return SliverList.separated(
      itemCount: students.length,
      itemBuilder: (_, index) {
        final student = students[index];

        return ListTile(
          leading: const Icon(Icons.elderly, size: 35),
          title: Text(student.firstName),
          subtitle: Row(
            children: [
              Text('${student.lastName}, '),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => studentBloc.add(StudentRemove(id: student.id)),
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
