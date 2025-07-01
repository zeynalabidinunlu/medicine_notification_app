import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/presentation/appointment/widgets/appointment_detail.dart';
import 'package:medicine_notification_app/presentation/examination/widgets/examination_detail.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';
import 'package:provider/provider.dart';

class DoctorDetailView extends StatelessWidget {
  final int doctorId;

  const DoctorDetailView({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doktor Detayları')),
      body: FutureBuilder<Doctor?>(
        future:
            context.read<DoctorsRepository>().getDoctorWithDetails(doctorId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final doctor = snapshot.data;
          if (doctor == null) {
            return const Center(child: Text('Doktor bulunamadı'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doktor: ${doctor.name}',
                    style: Theme.of(context).textTheme.headlineSmall),
                Text('Klinik: ${doctor.klinik}'),
                const SizedBox(height: 20),
                Text('Randevular:',
                    style: Theme.of(context).textTheme.titleMedium),
                ...doctor.appointments.map((appointment) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentDetail(
                              appointment: appointment,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(appointment.hospitalName ?? ''),
                          subtitle: Text(appointment.appointmentNotes ?? ''),
                          trailing: Text(appointment.appointmentDate
                                  ?.toString()
                                  .split(' ')[0] ??
                              ''),
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Text('Muayeneler:',
                    style: Theme.of(context).textTheme.titleMedium),
                ...doctor.examinations.map((examination) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExaminationDetail(
                                examination: examination,
                              ),
                            ));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(examination.examinationNotes ?? ''),
                          trailing: Text(examination.examinationDate
                                  ?.toString()
                                  .split(' ')[0] ??
                              ''),
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
