import 'package:isar/isar.dart';

part 'blood_pressure_model.g.dart';

@collection
class BloodPressure {
  Id? id;
  double? systolic;
  double? diastolic;
  double? pulse;
  
  DateTime? measurementDate;
  String? notes;
}
