import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/repository/blood_pressure/blood_pressure_repository.dart';

class BloodPressureViewModel extends ChangeNotifier {
  final IBloodRepository _bloodPressureRepository;

  BloodPressureViewModel(this._bloodPressureRepository);

  // State variables
  List<BloodPressure> _bloodPressures = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<BloodPressure> get bloodPressures => _bloodPressures;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load all blood pressures
  Future<void> loadBloodPressures() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      debugPrint('ViewModel: Loading blood pressures');
      _bloodPressures = await _bloodPressureRepository.getAllBloodPressures();
      debugPrint('ViewModel: Loaded ${_bloodPressures.length} blood pressures');
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('ViewModel: Error loading blood pressures: $e');
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> addBloodPressure(BloodPressure bloodPressure) async {
    try {
      debugPrint('ViewModel: Adding blood pressure');
      await _bloodPressureRepository.addBloodPressure(bloodPressure);
      debugPrint('ViewModel: Blood pressure added successfully');
      
      // Veri eklendikten sonra listeyi güncelle
      await loadBloodPressures();
    } catch (e) {
      debugPrint('ViewModel: Error adding blood pressure: $e');
      rethrow;
    }
  }

  Future<void> updateBloodPressure(BloodPressure bloodPressure) async {
    try {
      debugPrint('ViewModel: Updating blood pressure');
      await _bloodPressureRepository.updateBloodPressure(bloodPressure);
      debugPrint('ViewModel: Blood pressure updated successfully');
      
      // Veri güncellendikten sonra listeyi güncelle
      await loadBloodPressures();
    } catch (e) {
      debugPrint('ViewModel: Error updating blood pressure: $e');
      rethrow;
    }
  }

  Future<void> deleteBloodPressure(int id) async {
    try {
      debugPrint('ViewModel: Deleting blood pressure with ID: $id');
      await _bloodPressureRepository.deleteBloodPressure(id);
      debugPrint('ViewModel: Blood pressure deleted successfully');
      
      // Veri silindikten sonra listeyi güncelle
      await loadBloodPressures();
    } catch (e) {
      debugPrint('ViewModel: Error deleting blood pressure: $e');
      rethrow;
    }
  }

  // Eski method - geriye dönük uyumluluk için
  Future<List<BloodPressure>> getAllBloodPressures() async {
    await loadBloodPressures();
    return _bloodPressures;
  }
}