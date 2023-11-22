import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/app_form_field.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/library/bloc/library_bloc.dart';

class LibraryForm extends StatefulWidget {
  const LibraryForm({super.key});

  @override
  State<LibraryForm> createState() => _LibraryFormState();
}

class _LibraryFormState extends State<LibraryForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _idController;
  late final TextEditingController _bookController;
  late final LibraryBloc _libraryBloc;

  bool _availability = true;

  @override
  void initState() {
    super.initState();
    _libraryBloc = BlocProvider.of<LibraryBloc>(context);
    _idController = TextEditingController(text: '1');
    _bookController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _bookController.dispose();
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
              'Library Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Availability',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _idController,
              labelName: 'Library Id',
              validation: Validator.validId,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _bookController,
              labelName: 'Book Id',
            ),
            SpacingFoundation.verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Library is available'),
                  selected: _availability,
                  onSelected: (_) => setState(() => _availability = true),
                  side: BorderSide.none,
                ),
                SpacingFoundation.horizontalSpaceSmall,
                ChoiceChip(
                  label: const Text("Library isn't available"),
                  selected: !_availability,
                  onSelected: (_) => setState(() => _availability = false),
                  side: BorderSide.none,
                ),
              ],
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

                    _libraryBloc.add(
                      LibraryAdd(
                        library: LibrariesCompanion(
                          availability: Value(_availability),
                          id: Value(int.parse(_idController.text)),
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
