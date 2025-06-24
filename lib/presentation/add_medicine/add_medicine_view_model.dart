import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/data/service/isar_service.dart';

class AddMedicineViewModel extends ChangeNotifier {
  final IsarService _isarService;

  AddMedicineViewModel(this._isarService);

  UsageTypes? selectedUsageType;
  HungerSituation? selectedHungerSituation;

  HungerSituation? get selectedHungerSituations => selectedHungerSituation;
  UsageTypes? get selectedUsageTypes => selectedUsageType;

  void setHungerSituationTypes(HungerSituation hunger){
    selectedHungerSituation =hunger;
    notifyListeners();
  }

  void setUsageType(UsageTypes usageType) {
    selectedUsageType = usageType;
    notifyListeners();
  }

  Future<void> saveMedicine(Medicine newMedicine) async {
    await _isarService.saveMedicine(newMedicine);
    notifyListeners(); // Değişiklikten sonra çağrılmalı
  }

  Future<List<Medicine>> getAllMedicine() async {
    List<Medicine> listOffAllMedicine = await _isarService.getAllMedicine();
    notifyListeners();
    return listOffAllMedicine;
  }

  Future<void> updateMedicine(Medicine upadateMedicine) async {
    await _isarService.updateMedicine(upadateMedicine);
    notifyListeners();
  }

  Future<void> deleteMedicine(int medicineId) async {
    await _isarService.deleteMedicine(medicineId);
    notifyListeners();
  }
}
