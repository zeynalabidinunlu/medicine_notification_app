import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';

abstract class IDoctorsRepository {
  Future<List<Doctor>> getAllDoctors();
  Future<void> saveDoctor(Doctor doctor);
  Future<void> updateDoctor(int id, Doctor doctor);
  Future<void> deleteDoctor(int id);
  Future<Doctor?> getDoctorWithDetails(int doctorId);
}

class DoctorsRepository implements IDoctorsRepository {
  final Future<Isar> _isar = DatabaseManager().db;

  @override
  Future<void> deleteDoctor(int id) async {
    final isar = await _isar;
    return isar.writeTxn(() async {
      await isar.doctors.delete(id);
    });
  }

  @override
  Future<Doctor?> getDoctorWithDetails(int doctorId) async {
    final isar = await _isar;
    final doctor = await isar.doctors.get(doctorId);
    if (doctor != null) {
      // İlişkili verileri yükle
      await doctor.appointments.load();
      await doctor.examinations.load();
    }
    return doctor;
  }

  @override
  Future<List<Doctor>> getAllDoctors() {
    return _isar.then((isar) => isar.doctors.where().findAll());
  }

  @override
  Future<void> saveDoctor(Doctor doctor) {
    return _isar.then((isar) => isar.writeTxn(() async {
          await isar.doctors.put(doctor);
        }));
  }

  @override
  Future<void> updateDoctor(int id, Doctor doctor) {
    return _isar.then((isar) => isar.writeTxn(() async {
          final existingDoctor = await isar.doctors.get(id);
          if (existingDoctor != null) {
            existingDoctor.name = doctor.name;
            existingDoctor.daysOff = doctor.daysOff;
            existingDoctor.klinik = doctor.klinik;
            await isar.doctors.put(existingDoctor);
          }
        }));
  }
}
