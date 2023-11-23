import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/spacing_foundation.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/classroom/bloc/classroom_bloc.dart';

class ClassroomForm extends StatefulWidget {
  const ClassroomForm({super.key});

  @override
  State<ClassroomForm> createState() => _ClassroomFormState();
}

class _ClassroomFormState extends State<ClassroomForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _buildingController;
  late final TextEditingController _roomNumberController;
  late final TextEditingController _capacityController;
  late final ClassroomBloc _classroomBloc;

  @override
  void initState() {
    super.initState();
    _classroomBloc = BlocProvider.of<ClassroomBloc>(context);
    _buildingController = TextEditingController();
    _roomNumberController = TextEditingController();
    _capacityController = TextEditingController();
  }

  @override
  void dispose() {
    _buildingController.dispose();
    _roomNumberController.dispose();
    _capacityController.dispose();
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
              'Classroom Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _buildingController,
              labelName: 'Building Name',
              validation: Validator.validName,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _roomNumberController,
              labelName: 'Room Number',
              validation: Validator.validId,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _capacityController,
              labelName: 'Capacity(digit)',
              validation: Validator.validId,
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

                    _classroomBloc.add(
                      ClassroomAdd(
                        classroom: ClassroomsCompanion(
                          building: Value(_buildingController.text),
                          roomNumber: Value(int.parse(_roomNumberController.text)),
                          capacity: Value(int.parse(_capacityController.text)),
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
