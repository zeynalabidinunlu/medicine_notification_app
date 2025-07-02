import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/common_page_transition.dart';
import 'package:medicine_notification_app/common/widgets/common_list_tile.dart';
import 'package:medicine_notification_app/presentation/doctors/doctors_view_model.dart';
import 'package:medicine_notification_app/presentation/doctors/widgets/adding_doctors.dart';
import 'package:medicine_notification_app/presentation/doctors/widgets/doctor_detail_view.dart';
import 'package:provider/provider.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DoctorsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doktorlar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to the adding doctors view
              context.fadeToPage(const AddingDoctors());
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: vm.getAllDoctors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Hata: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Doktor bulunamadı.'));
            } else {
              final doctors = snapshot.data!;
              return ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return CommonListTile(
                    leadingIcon: Icons.person,
                    trailingIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      context.fadeToPage(
                        DoctorDetailView(doctorId: doctor.id ?? 0),
                      );
                    },
                    title: doctor.name ?? 'Bilinmiyor',
                    subtitle: doctor.appointments.isEmpty
                        ? 'Randevu yok'
                        : 'Hastane Adı: ${doctor.appointments.first.hospitalName}',
                  );
                },
              );
            }
          }),
    );
  }
}
