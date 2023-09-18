import 'package:drift/drift.dart' show Value;
import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/features/data/datasource/databases/databases.dart';
import 'package:education_portal/features/presentation/teacher/bloc/teacher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final TextEditingController _phoneController;
  late final TextEditingController _adressController;
  late final TextEditingController _departmentController;
  late final TeacherBloc teacherBloc;
  int _gender = 0;

  @override
  void initState() {
    super.initState();
    teacherBloc = BlocProvider.of<TeacherBloc>(context);
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _adressController = TextEditingController();
    _departmentController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _adressController.dispose();
    _departmentController.dispose();
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
            SpacingFoundation.verticalSpaceMedium,
            AppFormField(
              controller: _nameController,
              labelName: 'Name',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _surnameController,
              labelName: 'Surname',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _emailController,
              labelName: 'Email',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _phoneController,
              labelName: 'Phone Number',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _adressController,
              labelName: 'Adress',
              hintText: 'Teacher Adress',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _departmentController,
              labelName: 'Department',
              hintText: 'Enter ID of the Department',
            ),
            SpacingFoundation.verticalSpaceMedium,
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
            SpacingFoundation.verticalSpaceMedium,
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  teacherBloc.add(
                    TeacherAdd(
                      teacher: TeachersCompanion(
                        firstName: Value(_nameController.text),
                        lastName: Value(_surnameController.text),
                        email: Value(_emailController.text),
                        phoneNumber: Value(_phoneController.text),
                        adress: Value(_adressController.text),
                        gender: const Value('man'),
                        departmentId: const Value(0),
                      ),
                    ),
                  );
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

class AppFormField extends StatelessWidget {
  const AppFormField({
    required this.controller,
    required this.labelName,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String labelName;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(labelName),
          hintText: hintText,
          fillColor: Theme.of(context).dialogBackgroundColor,
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
