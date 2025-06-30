import 'package:flutter/material.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddingDoctors(),
                ),
              );
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
                  return GestureDetector(
                      // Doktor listesinde tıklama
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorDetailView(doctorId: doctor.id!),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(doctor.name ?? 'Bilinmiyor'),
                        subtitle: Text(
                          doctor.appointments.isEmpty
                              ? 'Randevu yok'
                              : 'Randevular: ${doctor.appointments.first.hospitalName}', // Access the first appointment's hospitalName
                        ),
                      ));
                },
              );
            }
          }),
    );
  }
}
