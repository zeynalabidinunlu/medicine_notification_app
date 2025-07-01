import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';
import 'package:medicine_notification_app/data/models/medicine/medicine_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  late final Future<Isar> _db;

  // Singleton constructor
  DatabaseManager._internal() {
    _db = _initDb();
  }

  factory DatabaseManager() {
    return _instance;
  }

  Future<Isar> get db => _db;

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [
        MedicineSchema,
        AppointmentSchema,
        DoctorSchema,
        ExaminationSchema,
        BloodPressureSchema
      ],
      directory: dir.path,
      inspector: true, // geliştirirken Isar Inspector kullanmak istersen
    );
  }
}
