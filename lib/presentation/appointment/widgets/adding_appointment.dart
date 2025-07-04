// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/detail_custom_text_form_field.dart';
import 'package:medicine_notification_app/common/detail/detail_form_card.dart';
import 'package:medicine_notification_app/common/detail/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/detail_save_button.dart';
import 'package:medicine_notification_app/common/show_error_snack_bar.dart';
import 'package:medicine_notification_app/common/show_success_snack_bar.dart';
import 'package:medicine_notification_app/common/widgets/appointment_type_dropdown.dart';
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
  bool isSaving = false;

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
      showErrorSnackBar(context,'Doktorlar yüklenirken hata oluştu: $e');
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
        showErrorSnackBar(context,'Önce doktoru kaydetmelisiniz!');
        return;
      }

      setState(() {
        isSaving = true;
      });

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
        showSuccessSnackBar(
            context, 'Randevu başarılı bir şekilde kaydedildi !');

        Navigator.of(context).pop();
      } catch (e) {
        showErrorSnackBar(context, 'Randevu kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(title: 'Randevu Ekle', theme: theme),
      body: Column(
        children: [
          // Header Section
          DetailHeaderSection(
            title: 'Randevu Ekle',
            subtitle:
                'Randevu bilgilerinizi aşağıdaki formu doldurarak ekleyin',
            theme: theme,
            icon: Icon(
              Icons.add_circle_outline,
              size: 30,
              color: theme.colorScheme.onPrimary,
            ),
          ),

          // Form Section
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Hospital Information Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Hastane Bilgileri',
                        icon: Icons.local_hospital,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _hospitalNameController,
                            labelText: 'Hastane Adı',
                            icon: Icons.business,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen hastane adını girin';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                          const SizedBox(height: 16),
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _clinicNameController,
                            labelText: 'Klinik Adı',
                            icon: Icons.medical_services,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Randevu detayları
                      DetailFormCard(
                        theme: theme,
                        title: 'Randevu Detayları',
                        icon: Icons.calendar_today,
                        children: [
                          _buildDateTimeRow(theme),
                          const SizedBox(height: 16),
                          _buildAppointmentTypeDropdown(theme),
                          const SizedBox(height: 16),
                          _buildDoctorDropdown(theme),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Notes Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Notlar',
                        icon: Icons.note_alt,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _notesController,
                            labelText: 'Randevu Notları',
                            icon: Icons.edit_note,
                            maxLines: 3,
                            isOptional: true,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Save Button
                      DetailSaveButton(
                        loadingText: 'Kaydediliyor ..',
                        savedText: 'Randevuyu Kaydet',
                        theme: theme,
                        isSaving: isSaving,
                        onPressed: _saveAppointment,
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeRow(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: DatePickerField(
            controller: _appointmentDateController,
            labelText: "Randevu Tarihi",
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TimePickerField(
            controller: _appointmentTimeController,
            labelText: "Randevu Saati",
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentTypeDropdown(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppointmentTypeDropdown(
        onChanged: (selectedType) {
          setState(() {
            _selectedAppointmentType = selectedType;
          });
        },
      ),
    );
  }

  Widget _buildDoctorDropdown(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DoctorDropdown(
        onChanged: (selected) {
          setState(() {
            selectedDoctor = selected;
          });
        },
        selectedDoctor: selectedDoctor,
        labelText: 'Doktor Seçin',
      ),
    );
  }
}
