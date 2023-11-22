import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/mark/bloc/mark_bloc.dart';

class MarkForm extends StatefulWidget {
  const MarkForm({super.key});

  @override
  State<MarkForm> createState() => _MarkFormState();
}

class _MarkFormState extends State<MarkForm> {
  final _formKey = GlobalKey<FormState>();

  late final MarkBloc _markBloc;
  late final TextEditingController _idController;
  final int _selectedGrade = 1;

  @override
  void initState() {
    super.initState();
    _markBloc = BlocProvider.of<MarkBloc>(context);
    _idController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
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
              'Mark Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _idController,
              labelName: 'Mark Id',
              validation: Validator.validId,
            ),
            SpacingFoundation.verticalSpaceSmall,
            DropdownMenu(
              label: Text(
                'Grade',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onSelected: (value) => setState(() => _selectedGrade),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
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

                    _markBloc.add(
                      MarkAdd(
                        mark: MarksCompanion(
                          id: Value(int.parse(_idController.text)),
                          grade: Value(_selectedGrade),
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
