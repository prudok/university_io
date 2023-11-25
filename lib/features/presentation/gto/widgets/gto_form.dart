import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_io/common/foundations/foundations.dart';
import 'package:university_io/common/ui_kit/ui_kit.dart';
import 'package:university_io/common/utils/validator.dart';
import 'package:university_io/features/data/datasource/database/university_db.dart';
import 'package:university_io/features/presentation/gto/bloc/gto_bloc.dart';

class GTOForm extends StatefulWidget {
  const GTOForm({super.key});

  @override
  State<GTOForm> createState() => _GTOFormState();
}

class _GTOFormState extends State<GTOForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final GTOBloc _gtoBloc;

  @override
  void initState() {
    super.initState();
    _gtoBloc = BlocProvider.of<GTOBloc>(context);
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
              'GTO Form',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SpacingFoundation.verticalSpaceSmall,
            AppFormField(
              controller: _nameController,
              labelName: 'Author',
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

                    _gtoBloc.add(
                      GTOAdd(
                        gto: GTOsCompanion(
                          name: Value(_nameController.text),
                        ),
                      ),
                    );
                  }
                },
                style:
                    ElevatedButton.styleFrom(shadowColor: Colors.transparent),
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
