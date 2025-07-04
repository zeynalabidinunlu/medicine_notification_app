import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/appointment_type_dropdown.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';

// Dışarıdan gönderilecek: onChanged ve selectedType gibi parametreler için tanım yapılıyor
class DetailAppointmentTypeDropDown extends StatelessWidget {
  final ValueChanged<AppointmentTypes?> onChanged;
  final AppointmentTypes? selectedType;

  const DetailAppointmentTypeDropDown({
    Key? key,
    required this.onChanged,
    this.selectedType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppointmentTypeDropdown(
        onChanged: onChanged,
        selectedType: selectedType,
      ),
    );
  }
}
