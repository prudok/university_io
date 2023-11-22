import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/library/bloc/library_bloc.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({required this.libraries, super.key});

  final List<Library> libraries;

  @override
  Widget build(BuildContext context) {
    final libraryBloc = BlocProvider.of<LibraryBloc>(context);

    return SliverList.separated(
      itemCount: libraries.length,
      itemBuilder: (_, index) {
        final library = libraries[index];

        return ListTile(
          leading: const Icon(Icons.book, size: 35),
          title: Text('${library.id}'),
          subtitle: Row(
            children: [
              Text('${library.availability}'),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => libraryBloc.add(LibraryRemove(id: library.id)),
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
