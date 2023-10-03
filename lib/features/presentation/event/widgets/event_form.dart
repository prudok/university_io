import 'package:drift/drift.dart' show Value;
import 'package:education_portal/common/foundations/spacing_foundation.dart';
import 'package:education_portal/common/ui_kit/ui_kit.dart';
import 'package:education_portal/common/validator.dart';
import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/presentation/event/bloc/event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _emailController;
  late final EventBloc _eventBloc;

  @override
  void initState() {
    super.initState();
    _eventBloc = BlocProvider.of<EventBloc>(context);
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
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
              'Event Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _titleController,
              labelName: 'Title',
              validation: Validator.validName,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _descriptionController,
              labelName: 'Description',
              validation: Validator.validSurname,
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

                    _eventBloc.add(
                      EventAdd(
                        event: EventsCompanion(
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
