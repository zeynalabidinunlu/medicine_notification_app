import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';

part 'appointment_model.g.dart';


@collection
class Appointment {
  Id? id;
  String? clinic;
  String? appointmentNotes;
  DateTime? appointmentDate;
  String? hospitalName;

  @Enumerated(EnumType.name)
  AppointmentTypes? appointmentTypes;

  // Backlink: Bu appointment hangi doktora bağlı?
  @Backlink(to: 'appointments')
  final doctor = IsarLink<Doctor>();
}

