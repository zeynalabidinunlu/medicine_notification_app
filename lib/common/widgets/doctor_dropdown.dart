import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/show_error_snack_bar.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';
import 'package:provider/provider.dart';

class DoctorDropdown extends StatefulWidget {
  final Doctor? selectedDoctor;
  final ValueChanged<Doctor?> onChanged;
  final String? labelText;

  const DoctorDropdown({
    super.key,
    this.selectedDoctor,
    required this.onChanged,
    this.labelText,
  });

  @override
  State<DoctorDropdown> createState() => _DoctorDropdownState();
}

class _DoctorDropdownState extends State<DoctorDropdown> {
  List<Doctor> doctors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    try {
      final doctorsRepository =
          Provider.of<DoctorsRepository>(context, listen: false);
      final doctorsList = await doctorsRepository.getAllDoctors();
      setState(() {
        doctors = doctorsList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorSnackBar(context,'Doktorlar yüklenirken hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return DropdownButtonFormField<Doctor>(
      value: widget.selectedDoctor,
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Doktor Seçin',
        border: const OutlineInputBorder(),
      ),
      items: doctors.map((doctor) {
        return DropdownMenuItem<Doctor>(
          value: doctor,
          child: Text(doctor.name ?? 'Bilinmiyor'),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}

