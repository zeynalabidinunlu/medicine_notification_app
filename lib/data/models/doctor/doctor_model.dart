import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';

part 'doctor_model.g.dart';
@collection
class Doctor {
  Id? id;

  String? name;

  @Enumerated(EnumType.name)
  Days? daysOff;

  String? klinik;

  final examinations = IsarLinks<Examination>();

  final appointments = IsarLinks<Appointment>();
}
