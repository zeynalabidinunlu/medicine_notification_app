import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';

class AppointmentTypeDropdown extends StatelessWidget {
  final AppointmentTypes? selectedType;
  final ValueChanged<AppointmentTypes?> onChanged;
  final String labelText;

  const AppointmentTypeDropdown({
    super.key,
    this.selectedType,
    required this.onChanged,
    this.labelText = 'Randevu Türü',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AppointmentTypes>(
      value: selectedType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      items: AppointmentTypes.values.map((type) {
        return DropdownMenuItem<AppointmentTypes>(
          value: type,
          child: Text(type.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
