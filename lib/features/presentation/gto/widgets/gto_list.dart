import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/gto/bloc/gto_bloc.dart';

class GTOList extends StatelessWidget {
  const GTOList({required this.gtos, super.key});

  final List<GTO> gtos;

  @override
  Widget build(BuildContext context) {
    final gtoBloc = BlocProvider.of<GTOBloc>(context);

    return SliverList.separated(
      itemCount: gtos.length,
      itemBuilder: (_, index) {
        final gto = gtos[index];

        return ListTile(
          leading: const Icon(Icons.sports, size: 35),
          title: Text('ID: ${gto.id}'),
          subtitle: Row(
            children: [
              Text('Name: ${gto.name}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => gtoBloc.add(GTORemove(id: gto.id)),
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
