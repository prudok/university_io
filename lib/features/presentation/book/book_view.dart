import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/features/presentation/book/bloc/book_bloc.dart';
import 'package:university_io/features/presentation/book/widgets/book_list.dart';

@RoutePage()
class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (_, state) {
          return switch (state) {
            final BookInitial _ => const Center(child: CircularProgressIndicator()),
            final BookLoading _ => const Center(child: CircularProgressIndicator()),
            final BookFailed error => Center(child: Text(error.errorMessage)),
            final BookLoaded state => state.books.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      BookList(books: state.books),
                    ],
                  )
                : const Center(child: Text('No Books Found.')),
          };
        },
      ),
    );
  }
}
