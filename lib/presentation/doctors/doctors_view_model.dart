import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';

class DoctorsViewModel extends ChangeNotifier {
  final IDoctorsRepository _doctorsRepository;
  DoctorsViewModel(this._doctorsRepository);

  Future<List<Doctor>> getAllDoctors() async {
    return await _doctorsRepository.getAllDoctors();
  }

  Future<void> saveDoctor(Doctor doctor) async {
    await _doctorsRepository.saveDoctor(doctor);
    notifyListeners();
  }

  Future<void> updateDoctor(int id, Doctor doctor) async {
    await _doctorsRepository.updateDoctor(id, doctor);
    notifyListeners();
  }

  Future<void> deleteDoctor(int id) async {
    await _doctorsRepository.deleteDoctor(id);
    notifyListeners();
  }
}
