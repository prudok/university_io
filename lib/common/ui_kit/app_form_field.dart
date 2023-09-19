import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    required this.controller,
    required this.labelName,
    this.validation,
    this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String? Function(String?)? validation;
  final String labelName;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: TextFormField(
        validator: validation,
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
