import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/service/isar_service.dart';

class UpdateScreenViewModel extends ChangeNotifier {
  final IsarService _isarService = IsarService();

  late Medicine medicine;

  UpdateScreenViewModel(this.medicine);

  Future<void> updateMedicine(int medicineId, Medicine updatedMedicine) async {
    await _isarService.updateMedicine(medicineId, updatedMedicine);
    medicine = updatedMedicine;
    notifyListeners();
  }
  
}
