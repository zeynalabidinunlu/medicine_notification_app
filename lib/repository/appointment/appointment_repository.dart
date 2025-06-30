import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';

abstract class IAppointmentRepository {
  Future<List<Appointment>> getAllAppointments();
  Future<void> saveAppointment(Appointment appointment);
  Future<void> updateAppointment(int id, Appointment appointment);
  Future<void> deleteAppointment(int id);
}

class AppointmentRepository implements IAppointmentRepository {
  final Isar isar;

  AppointmentRepository(this.isar);
  @override
  Future<void> deleteAppointment(int id) async {
    await isar.writeTxn(() async {
      await isar.appointments.delete(id);
    });
  }

  @override
  Future<List<Appointment>> getAllAppointments() {
    return isar.appointments.where().findAll();
  }

  @override
  Future<void> saveAppointment(Appointment appointment) {
    return isar.writeTxn(() async {
      await isar.appointments.put(appointment);
    });
  }

  @override
  Future<void> updateAppointment(int id, Appointment appointment) {
    return isar.writeTxn(() async {
      final existingAppointment = await isar.appointments.get(id);
      if (existingAppointment != null) {
        existingAppointment.appointmentDate = appointment.appointmentDate;
        existingAppointment.appointmentTypes = appointment.appointmentTypes;
        existingAppointment.clinic = appointment.clinic;
        existingAppointment.appointmentNotes = appointment.appointmentNotes;
        existingAppointment.hospitalName = appointment.hospitalName;
        
        await isar.appointments.put(existingAppointment);
      }
    });
  }
}
