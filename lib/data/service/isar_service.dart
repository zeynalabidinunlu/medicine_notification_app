import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  Future<Isar> openDB() async {
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

  Future<List<Medicine>> getAllMedicine() async {
    final isar = await db;
    return await isar.medicines.where().findAll();
  }

  Future<void> deleteMedicine(int medicineId) async {
    final isar = await db;
    isar.writeTxn(() => isar.medicines.delete(medicineId));
  }

  Future<void> updateMedicine(Medicine updateMedicine) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.medicines.put(updateMedicine);
    });
  }
}
