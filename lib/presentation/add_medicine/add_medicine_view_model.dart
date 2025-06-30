import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:medicine_notification_app/repository/medicine/medicine_repository.dart';

class AddMedicineViewModel extends ChangeNotifier {
  final MedicineRepository medicineRepository;

  AddMedicineViewModel({required this.medicineRepository});

  List<UsageTypes> selectedUsageType = [];
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

  void setUsageTypes(List<UsageTypes> usageTypes) {
    selectedUsageType = List.from(usageTypes);
    notifyListeners();
  }

  void clearUsageTypes() {
    selectedUsageType.clear();
    notifyListeners();
  }

  Future<void> saveMedicine(Medicine newMedicine) async {
    await medicineRepository.addMedicine(newMedicine);
    notifyListeners();
  }

  Future<List<Medicine>> getAllMedicine() async {
    List<Medicine> listOffAllMedicine = await medicineRepository.getAllMedicines();
    notifyListeners();
    return listOffAllMedicine;
  }

  Future<void> updateMedicine(int id, Medicine updateMedicine) async {
    await medicineRepository.updateMedicine(id, updateMedicine);
    notifyListeners();
  }

  Future<void> deleteMedicine(int medicineId) async {
    try {
      await medicineRepository.deleteMedicine(medicineId);
      notifyListeners();
    } catch (e) {
      print('İlaç silme hatası: $e');
      rethrow;
    }
  }
}
