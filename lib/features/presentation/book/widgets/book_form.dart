import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/common.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/book/bloc/book_bloc.dart';

class BookForm extends StatefulWidget {
  const BookForm({super.key});

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _authorController;
  late final TextEditingController _titleController;
  late final TextEditingController _publicationYearController;
  late final BookBloc _bookBloc;

  @override
  void initState() {
    super.initState();
    _bookBloc = BlocProvider.of<BookBloc>(context);
    _authorController = TextEditingController();
    _titleController = TextEditingController();
    _publicationYearController = TextEditingController();
  }

  @override
  void dispose() {
    _authorController.dispose();
    _titleController.dispose();
    _publicationYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SpacingFoundation.verticalSpaceSmall,
            Text(
              'Book Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _authorController,
              labelName: 'Author',
              validation: Validator.validName,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _titleController,
              labelName: 'Title',
              validation: Validator.validSurname,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _publicationYearController,
              labelName: 'Publication Year',
            ),
            SpacingFoundation.verticalSpaceMedium,
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }

                    _bookBloc.add(
                      BookAdd(
                        book: BooksCompanion(
                          author: Value(_authorController.text),
                          title: Value(_titleController.text),
                          publicationYear: Value(_publicationYearController.text),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
