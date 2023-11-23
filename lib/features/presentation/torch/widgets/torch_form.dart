import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/torch/bloc/torch_bloc.dart';

class TorchForm extends StatefulWidget {
  const TorchForm({super.key});

  @override
  State<TorchForm> createState() => _TorchFormState();
}

class _TorchFormState extends State<TorchForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _dateController;
  late final TextEditingController _descriptionController;
  late final TorchBloc _torchBloc;

  @override
  void initState() {
    super.initState();
    _torchBloc = BlocProvider.of<TorchBloc>(context);
    _dateController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
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
              'Torch Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _dateController,
              labelName: 'Date',
              validation: Validator.validId,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _descriptionController,
              labelName: 'Description',
              validation: Validator.validName,
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

                    _torchBloc.add(
                      TorchAdd(
                        torch: TorchesCompanion(
                          date: Value(_dateController.text),
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
