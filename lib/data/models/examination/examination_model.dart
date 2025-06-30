

import 'package:isar/isar.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';

part 'examination_model.g.dart';

@collection
class Examination {
  Id? id;

  String? patientComplaint;
  DateTime? nextControlTime;
  String? treatmentProcess;
  DateTime? examinationDate;
  String? examinationNotes;

  @Backlink(to: 'examinations')
  final doctor = IsarLink<Doctor>();
}
