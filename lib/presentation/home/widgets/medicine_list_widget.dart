import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/presentation/home/widgets/medicine_card_widget.dart';

class MedicineListWidget extends StatelessWidget {
  final List<Medicine> medicines;

  const MedicineListWidget({
    super.key,
    required this.medicines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return MedicineCardWidget(medicine: medicines[index]);
        },
      ),
    );
  }
}