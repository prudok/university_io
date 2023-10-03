import 'package:drift/drift.dart' show Value;
import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/common/ui_kit/ui_kit.dart';
import 'package:education_portal/common/validator.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/department/bloc/department_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentForm extends StatefulWidget {
  const DepartmentForm({super.key});

  @override
  State<DepartmentForm> createState() => _DepartmentFormState();
}

class _DepartmentFormState extends State<DepartmentForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final DepartmentBloc _departmentBloc;

  @override
  void initState() {
    super.initState();
    _departmentBloc = BlocProvider.of<DepartmentBloc>(context);
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
              'Department Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _nameController,
              labelName: 'Title',
              validation: Validator.validName,
            ),
            SpacingFoundation.verticalSpaceSmall,
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    _departmentBloc.add(
                      DepartmentAdd(
                        department: DepartmentsCompanion(name: Value(_nameController.text)),
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
