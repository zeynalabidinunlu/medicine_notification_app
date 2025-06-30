import 'package:flutter/foundation.dart';
import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:medicine_notification_app/repository/medicine_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final MedicineRepository _medicineRepository;

  HomeViewModel(this._medicineRepository);

  List<Medicine> _medicines = [];
  bool _isLoading = false;
  String? _error;

  List<Medicine> get medicines => _medicines;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadMedicines() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _medicines = await _medicineRepository.getAllMedicines();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteMedicine(int medicineId) async {
    try {
      await _medicineRepository.deleteMedicine(medicineId);
      _medicines.removeWhere((medicine) => medicine.id == medicineId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }
}