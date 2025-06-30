import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:medicine_notification_app/repository/medicine/medicine_repository.dart';

class UpdateScreenViewModel extends ChangeNotifier {
  final MedicineRepository _isarService = MedicineRepository();

  late Medicine medicine;

  UpdateScreenViewModel(this.medicine);

  Future<void> updateMedicine(int medicineId, Medicine updatedMedicine) async {
    await _isarService.updateMedicine(medicineId, updatedMedicine);
    medicine = updatedMedicine;
    notifyListeners();
  }
  
}
