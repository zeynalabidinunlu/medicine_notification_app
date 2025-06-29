import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  static Future<Isar> openDB() async {
    var dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MedicineSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  IsarService() {
    db = openDB();
  }

  Future<void> saveMedicine(Medicine newMedicine) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.medicines.putSync(newMedicine));
  }

  Future<void> saveUsageTypesToMedicine(
      Id medicineId, List<UsageTypes> usageTypes) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final medicine = await isar.medicines.get(medicineId);
      if (medicine != null) {
        medicine.usageTypes = usageTypes;
        await isar.medicines.put(medicine);
      }
    });
  }

  Future<List<Medicine>> getAllMedicine() async {
    final isar = await db;
    return await isar.medicines.where().findAll();
  }

  Future<void> deleteMedicine(int medicineId) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.medicines.delete(medicineId));
  }

  Future<void> updateMedicine(int medicineId, Medicine updatedMedicine) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final existingMedicine = await isar.medicines.get(medicineId);

      if (existingMedicine != null) {
        // Alanları güncelle
        existingMedicine.name = updatedMedicine.name;
        existingMedicine.description = updatedMedicine.description;
        existingMedicine.usageTypes = updatedMedicine.usageTypes;
        existingMedicine.reminderTimes = updatedMedicine.reminderTimes;
        existingMedicine.notificationText = updatedMedicine.notificationText;
        existingMedicine.hungerSituation = updatedMedicine.hungerSituation;
        existingMedicine.numberOfPills = updatedMedicine.numberOfPills;

        await isar.medicines.put(existingMedicine);
      } else {
        // Hata yönetimi: Kayıt bulunamadı
        throw Exception('Kayıt Bulunamadi id: $medicineId ');
      }
    });
  }
}
