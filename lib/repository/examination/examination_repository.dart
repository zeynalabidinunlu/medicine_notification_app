import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';

abstract class IExaminationRepository {
  Future<List<Examination>> getAllExaminations();
  Future<void> saveExamination(Examination examination);
  Future<void> updateExamination(int id, Examination examination);
  Future<void> deleteExamination(int id);
}

class ExaminationRepository implements IExaminationRepository {
  final Future<Isar> _isar = DatabaseManager().db;

  @override
  Future<void> deleteExamination(int id) {
    return _isar.then((isar) async {
      await isar.writeTxn(() async {
        await isar.examinations.delete(id);
      });
    });
  }

  @override
  Future<List<Examination>> getAllExaminations() {
    return _isar.then((isar) async {
      // Tüm muayeneleri yükle
      final examinations = await isar.examinations.where().findAll();
      for (var examination in examinations) {
        // İlişkili doktoru yükle
        await examination.doctor.load();
      }
      return examinations;
    });
  }

  @override
  Future<void> saveExamination(Examination examination) {
    return _isar.then((isar) async {
      await isar.writeTxn(() async {
        // Önce muayeneyi kaydet
        await isar.examinations.put(examination);

        // Doktor ilişkisini kontrol et ve kaydet
        if (examination.doctor.value != null) {
          // Doktor ilişkisini kaydet
          await examination.doctor.save();

          // Debug için log ekle
          print('Doktor ID: ${examination.doctor.value?.id}');
          print('Doktor Adı: ${examination.doctor.value?.name}');
          print('Muayene ID: ${examination.id}');
        } else {
          print('Uyarı: Doktor değeri null!');
        }
      });
    });
  }

  @override
  Future<void> updateExamination(int id, Examination examination) {
    return _isar.then((isar) async {
      await isar.writeTxn(() async {
        final existingExamination = await isar.examinations.get(id);
        if (existingExamination != null) {
          // Mevcut muayene bilgilerini güncelle
          existingExamination.examinationDate = examination.examinationDate;
          existingExamination.examinationNotes = examination.examinationNotes;
          existingExamination.nextControlTime = examination.nextControlTime;
          existingExamination.patientComplaint = examination.patientComplaint;
          existingExamination.treatmentProcess = examination.treatmentProcess;
          existingExamination.appointmentTypes = examination.appointmentTypes;
          existingExamination.doctor.value = examination.doctor.value;

          await isar.examinations.put(existingExamination);
        }
      });
    });
  }
}
