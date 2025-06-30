import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';

abstract class IAppointmentRepository {
  Future<List<Appointment>> getAllAppointments();
  Future<void> saveAppointment(Appointment appointment);
  Future<void> updateAppointment(int id, Appointment appointment);
  Future<void> deleteAppointment(int id);
}

class AppointmentRepository implements IAppointmentRepository {
  final Future<Isar> _isar = DatabaseManager().db;

  @override
  Future<void> deleteAppointment(int id) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.appointments.delete(id);
    });
  }

  @override
  Future<List<Appointment>> getAllAppointments() async {
    final isar = await _isar;
    // Doktor bilgilerini de yükle
    final appointments = await isar.appointments.where().findAll();
    for (var appointment in appointments) {
      await appointment.doctor.load();
    }
    return appointments;
  }

  @override
  Future<void> saveAppointment(Appointment appointment) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      // Önce randevuyu kaydet
      await isar.appointments.put(appointment);
      
      // Doktor ilişkisini kontrol et ve kaydet
      if (appointment.doctor.value != null) {
        // Doktor ilişkisini kaydet
        await appointment.doctor.save();
        
        // Debug için log ekle
        print('Doktor ID: ${appointment.doctor.value?.id}');
        print('Doktor Adı: ${appointment.doctor.value?.name}');
        print('Randevu ID: ${appointment.id}');
      } else {
        print('Uyarı: Doktor değeri null!');
      }
    });
  }

  @override
  Future<void> updateAppointment(int id, Appointment appointment) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      final existingAppointment = await isar.appointments.get(id);
      if (existingAppointment != null) {
        // Mevcut randevu bilgilerini güncelle
        existingAppointment.appointmentDate = appointment.appointmentDate;
        existingAppointment.appointmentTypes = appointment.appointmentTypes;
        existingAppointment.clinic = appointment.clinic;
        existingAppointment.appointmentNotes = appointment.appointmentNotes;
        existingAppointment.hospitalName = appointment.hospitalName;
        
        // Doktor ilişkisini güncelle
        if (appointment.doctor.value != null) {
          existingAppointment.doctor.value = appointment.doctor.value;
          await existingAppointment.doctor.save();
        }
        
        await isar.appointments.put(existingAppointment);
      }
    });
  }
}