// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/appbar/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/header/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/save/detail_save_button.dart';
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
      _showErrorSnackBar('Doktorlar yüklenirken hata oluştu: $e');
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
        _showErrorSnackBar('Lütfen bir doktor seçin!');
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
        _showSuccessSnackBar('Randevu başarıyla kaydedildi!');

        Navigator.of(context).pop();
      } catch (e) {
        _showErrorSnackBar('Randevu kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
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
                      _buildFormCard(
                        theme,
                        title: 'Hastane Bilgileri',
                        icon: Icons.local_hospital,
                        children: [
                          _buildCustomTextFormField(
                            theme,
                            controller: _hospitalNameController,
                            labelText: 'Hastane Adı',
                            icon: Icons.business,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen hastane adını girin';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildCustomTextFormField(
                            theme,
                            controller: _clinicNameController,
                            labelText: 'Klinik Adı',
                            icon: Icons.medical_services,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Appointment Details Card
                      _buildFormCard(
                        theme,
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
                      _buildFormCard(
                        theme,
                        title: 'Notlar',
                        icon: Icons.note_alt,
                        children: [
                          _buildCustomTextFormField(
                            theme,
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

  Widget _buildFormCard(
    ThemeData theme, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextFormField(
    ThemeData theme, {
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
    int maxLines = 1,
    bool isOptional = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: theme.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
