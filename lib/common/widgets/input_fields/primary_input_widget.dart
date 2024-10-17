import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrimaryInputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPhoneField;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const PrimaryInputTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.prefixIcon,
      this.isPhoneField = false,
      this.validator,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isPhoneField ? TextInputType.phone : keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        prefixText: isPhoneField ? '+237' : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
