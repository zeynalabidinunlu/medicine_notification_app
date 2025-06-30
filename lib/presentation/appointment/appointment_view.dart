import 'package:flutter/material.dart';
import 'package:medicine_notification_app/presentation/appointment/appointment_view_model.dart';
import 'package:provider/provider.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AppointmentViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randevular'),
      ),
      body: FutureBuilder(
        future: vm.getAllAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Randevu bulunamadı.'));
          } else {
            final appointments = snapshot.data!;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return ListTile(
                  title: Text(appointment.hospitalName.toString()),
                  subtitle: Text(appointment.appointmentDate.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
