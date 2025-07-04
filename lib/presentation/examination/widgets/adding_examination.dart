// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/detail_appointment_type_drop_down.dart';
import 'package:medicine_notification_app/common/detail/detail_custom_text_form_field.dart';
import 'package:medicine_notification_app/common/detail/detail_form_card.dart';
import 'package:medicine_notification_app/common/detail/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/detail_save_button.dart';
import 'package:medicine_notification_app/common/show_error_snack_bar.dart';
import 'package:medicine_notification_app/common/show_success_snack_bar.dart';
import 'package:medicine_notification_app/common/widgets/date_picker_field.dart';
import 'package:medicine_notification_app/common/widgets/doctor_dropdown.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';
import 'package:medicine_notification_app/presentation/examination/examination_view_model.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';
import 'package:provider/provider.dart';

class AddingExamination extends StatefulWidget {
  const AddingExamination({super.key});

  @override
  State<AddingExamination> createState() => _AddingExaminationState();
}

class _AddingExaminationState extends State<AddingExamination> {
  final _formKey = GlobalKey<FormState>();
  AppointmentTypes? _selectedAppointmentType;

  // Controllers
  final TextEditingController _patientComplaintController =
      TextEditingController();
  final TextEditingController _treatmentProcessController =
      TextEditingController();
  final TextEditingController _examinationNotesController =
      TextEditingController();
  final TextEditingController _nextControlTimeController =
      TextEditingController();
  final TextEditingController _examinationDateController =
      TextEditingController();

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
      showErrorSnackBar(context, 'Doktorlar yüklenirken hata oluştu: $e');
    }
  }

  @override
  void dispose() {
    _patientComplaintController.dispose();
    _treatmentProcessController.dispose();
    _examinationNotesController.dispose();
    _nextControlTimeController.dispose();
    _examinationDateController.dispose();
    super.dispose();
  }

  void _saveExamination() async {
    if (_formKey.currentState!.validate()) {
      // Check if doctor is selected
      if (selectedDoctor == null) {
        showErrorSnackBar(
            context, 'Doktor ekledikten sonra muayene kaydedebilirsiniz !');
        return;
      }

      setState(() {
        isSaving = true;
      });

      try {
        final vm = context.read<ExaminationViewModel>();

        // Parse dates
        final String examinationDate = _examinationDateController.text;
        final String nextControlTime = _nextControlTimeController.text;

        final DateTime parsedExaminationDate = _parseDateTime(examinationDate);
        final DateTime parsedNextControlTime = _parseDateTime(nextControlTime);

        // Create examination
        final examination = Examination()
          ..appointmentTypes = _selectedAppointmentType
          ..patientComplaint = _patientComplaintController.text
          ..treatmentProcess = _treatmentProcessController.text
          ..examinationDate = parsedExaminationDate
          ..examinationNotes = _examinationNotesController.text
          ..nextControlTime = parsedNextControlTime;

        // IMPORTANT: Link the doctor to the examination
        examination.doctor.value = selectedDoctor;

        // Debug için log ekle
        print('Seçilen Doktor: ${selectedDoctor?.name}');
        print('Doktor ID: ${selectedDoctor?.id}');
        print('Muayene Tarihi: $parsedExaminationDate');

        // Save examination
        await vm.saveExamination(examination);

        // Show success message
        showSuccessSnackBar(context, 'Muayene başarıyla kaydedildi!');

        Navigator.of(context).pop();
      } catch (e) {
        showErrorSnackBar(context, 'Muayene kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  // Helper method to parse date
  DateTime _parseDateTime(String dateString) {
    // Parse date (YYYY-MM-DD format)
    final dateParts = dateString.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    return DateTime(year, month, day);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(
        title: 'Muayene Ekle',
        theme: theme,
      ),
      body: Column(
        children: [
          // Header Section
          DetailHeaderSection(
            title: 'Yeni Muayene',
            subtitle:
                'Muayene bilgilerinizi aşağıdaki formu doldurarak ekleyin',
            theme: theme,
            icon: Icon(
              Icons.medical_services,
              size: 40,
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
                      // Patient Information Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Hasta Bilgileri',
                        icon: Icons.person,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _patientComplaintController,
                            labelText: 'Hasta Şikayeti',
                            icon: Icons.psychology,
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen hasta şikayetini girin';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Treatment Details Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Tedavi Detayları',
                        icon: Icons.medical_services,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _treatmentProcessController,
                            labelText:
                                'Tedavi Süreci Hakkında Notlarınızı Girin',
                            icon: Icons.healing,
                            maxLines: 4,
                            isOptional: true,
                          ),
                          const SizedBox(height: 16),
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _examinationNotesController,
                            labelText: 'Muayene Notları',
                            icon: Icons.note_add,
                            maxLines: 3,
                            isOptional: true,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Examination Details Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Muayene Detayları',
                        icon: Icons.event_note,
                        children: [
                          _buildDateTimeRow(theme),
                          const SizedBox(height: 16),
                          DetailAppointmentTypeDropDown(
                            selectedType: _selectedAppointmentType,
                            onChanged: (type) {
                              setState(() {
                                _selectedAppointmentType = type;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildDoctorDropdown(theme),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Save Button
                      DetailSaveButton(
                          onPressed: _saveExamination,
                          loadingText: 'Kaydediliyor ...',
                          savedText: 'Muayeneyi Kaydet',
                          theme: theme,
                          isSaving: isSaving),
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
    return Column(
      children: [
        DatePickerField(
          controller: _examinationDateController,
          labelText: "Muayene Tarihi",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen muayene tarihini seçin';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        DatePickerField(
          controller: _nextControlTimeController,
          labelText: "Sonraki Kontrol Zamanı",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen sonraki kontrol zamanını girin';
            }
            return null;
          },
        ),
      ],
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
