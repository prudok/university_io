import 'package:drift/drift.dart' show Value;
import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/common/ui_kit/ui_kit.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/project/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectForm extends StatefulWidget {
  const ProjectForm({super.key});

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final ProjectBloc projectBloc;

  @override
  void initState() {
    super.initState();
    projectBloc = BlocProvider.of<ProjectBloc>(context);
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
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
              'Project Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _titleController,
              labelName: 'Title',
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _descriptionController,
              labelName: 'Description',
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
                    projectBloc.add(
                      ProjectAdd(
                        project: ProjectsCompanion(
                          title: Value(_titleController.text),
                          description: Value(_descriptionController.text),
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
