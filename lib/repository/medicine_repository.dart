import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:medicine_notification_app/service/isar_service.dart';
import 'package:isar/isar.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getAllMedicines();
  Future<void> deleteMedicine(int medicineId);
  Future<Medicine> addMedicine(Medicine medicine);
  Future<Medicine> updateMedicine(Medicine medicine);
}

class IsarMedicineRepository implements MedicineRepository {
  @override
  Future<List<Medicine>> getAllMedicines() async {
    final isar = await IsarService.openDB();
    return await isar.medicines.where().findAll();
  }

  @override
  Future<void> deleteMedicine(int medicineId) async {
    final isar = await IsarService.openDB();
    await isar.writeTxn(() async {
      await isar.medicines.delete(medicineId);
    });
  }

  @override
  Future<Medicine> addMedicine(Medicine medicine) async {
    final isar = await IsarService.openDB();
    await isar.writeTxn(() async {
      await isar.medicines.put(medicine);
    });
    return medicine;
  }

  @override
  Future<Medicine> updateMedicine(Medicine medicine) async {
    final isar = await IsarService.openDB();
    await isar.writeTxn(() async {
      await isar.medicines.put(medicine);
    });
    return medicine;
  }
}