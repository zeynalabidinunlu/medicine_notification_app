 import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:medicine_notification_app/repository/appointment/appointment_repository.dart';

class AppointmentViewModel extends ChangeNotifier{
final IAppointmentRepository _appointmentRepository;
  
AppointmentViewModel(this._appointmentRepository);

  Future<List<Appointment>> getAllAppointments() async {
    return await _appointmentRepository.getAllAppointments();
    
  }

  Future<void> saveAppointment(Appointment appointment) async {
    await _appointmentRepository.saveAppointment(appointment);
    notifyListeners();
  }

  Future<void> updateAppointment(int id, Appointment appointment) async {
    await _appointmentRepository.updateAppointment(id, appointment);
    notifyListeners();
  }

  Future<void> deleteAppointment(int id) async {
    await _appointmentRepository.deleteAppointment(id);
    notifyListeners();
  }
}