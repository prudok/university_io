import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/student/bloc/student_bloc.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final StudentBloc _studentBloc;
  int _groupId = 0;

  @override
  void initState() {
    super.initState();
    _studentBloc = BlocProvider.of<StudentBloc>(context);
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
              'Student Form',
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
            Text('Group id', style: Theme.of(context).textTheme.bodySmall),
            DropdownMenu(
              onSelected: (value) => setState(() => _groupId = value!),
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

                    _studentBloc.add(
                      StudentAdd(
                        student: StudentsCompanion(
                          firstName: Value(_nameController.text),
                          lastName: Value(_surnameController.text),
                          email: Value(_emailController.text),
                          groupId: Value(_groupId),
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
