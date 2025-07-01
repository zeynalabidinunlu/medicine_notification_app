import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}