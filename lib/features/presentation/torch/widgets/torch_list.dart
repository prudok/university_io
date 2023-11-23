import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/spacing_foundation.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/torch/bloc/torch_bloc.dart';

class TorchList extends StatelessWidget {
  const TorchList({required this.torches, super.key});

  final List<Torch> torches;

  @override
  Widget build(BuildContext context) {
    final torchBloc = BlocProvider.of<TorchBloc>(context);

    return SliverList.separated(
      itemCount: torches.length,
      itemBuilder: (_, index) {
        final torch = torches[index];

        return ListTile(
          leading: const Icon(Icons.tornado, size: 35),
          title: Text('Torch ID: ${torch.id}'),
          subtitle: Row(
            children: [
              Text('Description: ${torch.description},'),
              SpacingFoundation.horizontalSpaceSmall,
              Text('Event Date: ${torch.date}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => torchBloc.add(TorchRemove(id: torch.id)),
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
