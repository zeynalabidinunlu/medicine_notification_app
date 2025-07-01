import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';

class TimePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const TimePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText,
      readOnly: true,
      suffixIcon: const Icon(Icons.access_time),
      validator: validator,
      onTap: () => _selectTime(context),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      controller.text = pickedTime.format(context);
    }
  }
}
