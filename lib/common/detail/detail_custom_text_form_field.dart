// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailCustomTextFormField extends StatelessWidget {
  final ThemeData theme;
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String Function(String?)? validator;
  final int? maxLines;
  final bool? isOptional;
  final TextInputType? keyboardType;

  DetailCustomTextFormField({
    Key? key,
    required this.theme,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.maxLines,
    this.isOptional,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: theme.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
