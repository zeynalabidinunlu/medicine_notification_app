import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.firstDate,
    this.lastDate,
    this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText,
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_today),
      validator: validator,
      onTap: () => _selectDate(context),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2101),
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    }
  }
}
