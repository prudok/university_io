import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/mark/bloc/mark_bloc.dart';

class MarkList extends StatelessWidget {
  const MarkList({required this.marks, super.key});

  final List<Mark> marks;

  @override
  Widget build(BuildContext context) {
    final markBloc = BlocProvider.of<MarkBloc>(context);

    return SliverList.separated(
      itemCount: marks.length,
      itemBuilder: (_, index) {
        final mark = marks[index];

        return ListTile(
          leading: const Icon(Icons.grade, size: 35),
          title: Text('Mark ID: ${mark.id}'),
          subtitle: Row(
            children: [
              Text('Grade: ${mark.grade}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => markBloc.add(MarkRemove(id: mark.id)),
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
