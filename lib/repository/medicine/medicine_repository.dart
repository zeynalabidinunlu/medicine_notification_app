import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';

abstract class IMedicineRepository {
  Future<List<Medicine>> getAllMedicines();
  Future<void> deleteMedicine(int medicineId);
  Future<Medicine> addMedicine(Medicine medicine);
  Future<Medicine> updateMedicine(int id, Medicine medicine);
}

class MedicineRepository implements IMedicineRepository {
  final Future<Isar> _isar = DatabaseManager().db;

  @override
  Future<List<Medicine>> getAllMedicines() async {
    final isar = await _isar;
    return await isar.medicines.where().findAll();
  }

  @override
  Future<void> deleteMedicine(int medicineId) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.medicines.delete(medicineId);
    });
  }

  @override
  Future<Medicine> addMedicine(Medicine medicine) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.medicines.put(medicine);
    });
    return medicine;
  }

  @override
  Future<Medicine> updateMedicine(int id, Medicine medicine) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      final existing = await isar.medicines.get(id);
      if (existing != null) {
        existing.name = medicine.name;
        existing.description = medicine.description;
        existing.notificationText = medicine.notificationText;
        existing.reminderTimes = medicine.reminderTimes;
        existing.usageTypes = medicine.usageTypes;
        existing.hungerSituation = medicine.hungerSituation;

        await isar.medicines.put(existing);
      }
    });
    return medicine;
  }
}
