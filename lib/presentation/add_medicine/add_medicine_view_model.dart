import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/data/service/isar_service.dart';

class AddMedicineViewModel extends ChangeNotifier {
  final IsarService _isarService;

  AddMedicineViewModel(this._isarService);

  List<UsageTypes> selectedUsageType = []; // Boş liste olarak başlat
  HungerSituation? selectedHungerSituation;

  HungerSituation? get selectedHungerSituations => selectedHungerSituation;
  List<UsageTypes> get selectedUsageTypes => selectedUsageType;

  void setHungerSituationTypes(HungerSituation hunger) {
    selectedHungerSituation = hunger;
    notifyListeners();
  }

  void toggleUsageType(UsageTypes type) {
    if (selectedUsageType.contains(type)) {
      selectedUsageType.remove(type);
    } else {
      selectedUsageType.add(type);
    }
    notifyListeners();
  }

  Future<void> saveUsageTypes(Id id, List<UsageTypes> usageTypes) async {
    return await _isarService.saveUsageTypesToMedicine(id, usageTypes);
  }

  // Tüm listeyi set etme metodu
  void setUsageTypes(List<UsageTypes> usageTypes) {
    selectedUsageType = List.from(usageTypes);
    notifyListeners();
  }

  // Seçili usage type'ları temizleme metodu
  void clearUsageTypes() {
    selectedUsageType.clear();
    notifyListeners();
  }

  Future<void> saveMedicine(Medicine newMedicine) async {
    await _isarService.saveMedicine(newMedicine);
    notifyListeners();
  }

  Future<List<Medicine>> getAllMedicine() async {
    List<Medicine> listOffAllMedicine = await _isarService.getAllMedicine();
    notifyListeners();
    return listOffAllMedicine;
  }

  Future<void> updateMedicine(Medicine updateMedicine) async {
    await _isarService.updateMedicine(updateMedicine);
    notifyListeners();
  }

  Future<void> deleteMedicine(int medicineId) async {
    await _isarService.deleteMedicine(medicineId);
    notifyListeners();
  }
}
