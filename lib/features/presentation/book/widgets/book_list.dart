import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/book/bloc/book_bloc.dart';

class BookList extends StatelessWidget {
  const BookList({required this.books, super.key});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final bookBloc = BlocProvider.of<BookBloc>(context);

    return SliverList.separated(
      itemCount: books.length,
      itemBuilder: (_, index) {
        final book = books[index];

        return ListTile(
          leading: const Icon(Icons.book, size: 35),
          title: Text(book.title),
          subtitle: Row(
            children: [
              Text(book.author),
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () => bookBloc.add(BookRemove(id: book.id)),
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
