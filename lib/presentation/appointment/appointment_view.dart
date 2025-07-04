import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/common_page_transition.dart';
import 'package:medicine_notification_app/common/widgets/common_list_tile.dart';
import 'package:medicine_notification_app/presentation/appointment/appointment_view_model.dart';
import 'package:medicine_notification_app/presentation/appointment/widgets/adding_appointment.dart';
import 'package:medicine_notification_app/presentation/appointment/widgets/appointment_detail.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AppointmentViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randevular'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.fadeToPage(
                const AddingAppointment(),
              );
            },
          ),
        ],
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
                return CommonListTile(
                    clinic: appointment.clinic ?? 'Bilinmiyor',
                    doctorName: appointment.doctor.value?.name ?? 'Bilinmiyor',
                    leadingIcon: Icons.calendar_today,
                    trailingIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      context.fadeToPage(
                        AppointmentDetail(appointment: appointment),
                      );
                    },
                    title: appointment.hospitalName.toString(),
                    subtitle: DateFormat('HH:mm')
                        .format(appointment.appointmentDate ?? DateTime.now()));
              },
            );
          }
        },
      ),
    );
  }
}
