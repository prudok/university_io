import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/common.dart';
import 'package:university_io/common/foundations/spacing_foundation.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/teacher/bloc/teacher_bloc.dart';

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final TeacherBloc _teacherBloc;
  int _gender = 0;

  @override
  void initState() {
    super.initState();
    _teacherBloc = BlocProvider.of<TeacherBloc>(context);
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
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
              'Teacher Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _nameController,
              labelName: 'Name',
              validation: Validator.validName,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _surnameController,
              labelName: 'Surname',
              validation: Validator.validSurname,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _emailController,
              labelName: 'Email',
            ),
            SpacingFoundation.verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Male'),
                  selected: _gender == 1,
                  onSelected: (_) => setState(() => _gender = 1),
                  side: BorderSide.none,
                ),
                SpacingFoundation.horizontalSpaceSmall,
                ChoiceChip(
                  label: const Text('Female'),
                  selected: _gender == 2,
                  onSelected: (_) => setState(() => _gender = 2),
                  side: BorderSide.none,
                ),
              ],
            ),
            SpacingFoundation.verticalSpaceSmall,
            DropdownMenu(
              onSelected: (value) => setState(() {}),
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

                    _teacherBloc.add(
                      TeacherAdd(
                        teacher: TeachersCompanion(
                          firstName: Value(_nameController.text),
                          lastName: Value(_surnameController.text),
                          email: Value(_emailController.text),
                          // gender: Value(GenderDefiner.getGenderValue(1)),
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
