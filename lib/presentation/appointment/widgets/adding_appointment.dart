import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/appointment_type_dropdown.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';
import 'package:medicine_notification_app/common/widgets/date_picker_field.dart';
import 'package:medicine_notification_app/common/widgets/doctor_dropdown.dart';
import 'package:medicine_notification_app/common/widgets/time_picker_field.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/presentation/appointment/appointment_view_model.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';
import 'package:provider/provider.dart';

class AddingAppointment extends StatefulWidget {
  const AddingAppointment({super.key});

  @override
  State<AddingAppointment> createState() => _AddingAppointmentState();
}

class _AddingAppointmentState extends State<AddingAppointment> {
  final _formKey = GlobalKey<FormState>();
  AppointmentTypes? _selectedAppointmentType;
  // Controllers
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _appointmentDateController =
      TextEditingController();
  final TextEditingController _appointmentTimeController =
      TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // Doctor related variables
  List<Doctor> doctors = [];
  Doctor? selectedDoctor;
  bool isLoadingDoctors = true;

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  // Load doctors from repository
  Future<void> _loadDoctors() async {
    try {
      final doctorsRepository =
          Provider.of<DoctorsRepository>(context, listen: false);
      final doctorsList = await doctorsRepository.getAllDoctors();
      setState(() {
        doctors = doctorsList;
        isLoadingDoctors = false;
      });
    } catch (e) {
      setState(() {
        isLoadingDoctors = false;
      });
      // Handle error - show snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Doktorlar yüklenirken hata oluştu: $e')),
      );
    }
  }

  @override
  void dispose() {
    _hospitalNameController.dispose();
    _appointmentDateController.dispose();
    _appointmentTimeController.dispose();
    _clinicNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveAppointment() async {
    if (_formKey.currentState!.validate()) {
      // Check if doctor is selected
      if (selectedDoctor == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen bir doktor seçin!')),
        );
        return;
      }

      try {
        final vm = context.read<AppointmentViewModel>();

        // Parse date and time
        final String dateString = _appointmentDateController.text;
        final String timeString = _appointmentTimeController.text;

        // Convert time format if needed (HH:MM AM/PM to 24-hour format)
        final DateTime appointmentDateTime =
            _parseDateTime(dateString, timeString);

        // Create appointment
        final appointment = Appointment()
          ..appointmentDate = appointmentDateTime
          ..hospitalName = _hospitalNameController.text
          ..clinic = _clinicNameController.text
          ..appointmentNotes = _notesController.text
          ..appointmentTypes = _selectedAppointmentType;

        // IMPORTANT: Link the doctor to the appointment
        appointment.doctor.value = selectedDoctor;

        // Debug için log ekle
        print('Seçilen Doktor: ${selectedDoctor?.name}');
        print('Doktor ID: ${selectedDoctor?.id}');

        // Save appointment
        await vm.saveAppointment(appointment);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Randevu başarıyla kaydedildi!')),
        );

        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Randevu kaydedilirken hata oluştu: $e')),
        );
      }
    }
  }

  // Helper method to parse date and time
  DateTime _parseDateTime(String dateString, String timeString) {
    // Parse date (YYYY-MM-DD format)
    final dateParts = dateString.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    // Parse time (could be in AM/PM format)
    TimeOfDay timeOfDay;
    if (timeString.contains('AM') || timeString.contains('PM')) {
      // Handle AM/PM format
      final bool isPM = timeString.contains('PM');
      final timeOnly = timeString.replaceAll(RegExp(r'[AP]M'), '').trim();
      final timeParts = timeOnly.split(':');
      int hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);

      if (isPM && hour != 12) hour += 12;
      if (!isPM && hour == 12) hour = 0;

      timeOfDay = TimeOfDay(hour: hour, minute: minute);
    } else {
      // Handle 24-hour format
      final timeParts = timeString.split(':');
      timeOfDay = TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      );
    }

    return DateTime(year, month, day, timeOfDay.hour, timeOfDay.minute);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randevu Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Hastane Adı',
                  controller: _hospitalNameController,
                  //   decoration: const InputDecoration(labelText: 'Hastane Adı'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen hastane adını girin';
                    }
                    return null;
                  },
                ),
                DatePickerField(
                  controller: _appointmentDateController,
                  labelText: "Randevu Tarihi",
                ),
                TimePickerField(
                    controller: _appointmentTimeController,
                    labelText: "Randevu Saaaati"),
                CustomTextFormField(
                  controller: _clinicNameController,
                  labelText: 'Klinik Adı',
                ),
                  CustomTextFormField(
                  controller: _notesController,
                  labelText: 'Notlar',
                  maxLines: 3,
                ),
                AppointmentTypeDropdown(onChanged: (selectedType) {
                  setState(() {
                    _selectedAppointmentType = selectedType;
                  });
                }),
                const SizedBox(height: 16),
              
                DoctorDropdown(
                    onChanged: (selected) {
                      setState(() {
                        selectedDoctor = selected;
                      });
                    },
                    selectedDoctor: selectedDoctor,
                    labelText: 'Doktor Seçin'),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveAppointment,
                    child: const Text('Kaydet'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
