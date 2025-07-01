import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/appointment_type_dropdown.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';
import 'package:medicine_notification_app/common/widgets/date_picker_field.dart';
import 'package:medicine_notification_app/common/widgets/doctor_dropdown.dart';
import 'package:medicine_notification_app/common/widgets/time_picker_field.dart';
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

  Doctor? _selectedDoctor;
  bool isLoadingDoctors = true;

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    try {
      Provider.of<DoctorsRepository>(context, listen: false);
      setState(() {
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
    _patientComplaintController.dispose();
    _treatmentProcessController.dispose();
    _examinationNotesController.dispose();
    _nextControlTimeController.dispose();
    _examinationDateController.dispose();
    super.dispose();
  }

  void _saveExamination() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDoctor == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lütfen bir doktor seçin')),
        );
        return;
      }
      try {
        final vm = context.read<ExaminationViewModel>();
        final String examinationDate = _examinationDateController.text;
        final String nextControlTime = _nextControlTimeController.text;

        final DateTime parsedExaminationDate = _parseDateTime(examinationDate);
        final DateTime parsedNextControlTime = _parseDateTime(nextControlTime);
        final examination = Examination()
          ..appointmentTypes = _selectedAppointmentType
          ..patientComplaint = _patientComplaintController.text
          ..treatmentProcess = _treatmentProcessController.text
          ..examinationDate = parsedExaminationDate
          ..examinationNotes = _examinationNotesController.text
          ..nextControlTime = parsedNextControlTime;

        examination.doctor.value = _selectedDoctor;
        print('Seçilen Doktor: ${_selectedDoctor?.name}');
        print('Muayene Tarihi: $parsedExaminationDate');
        await vm.saveExamination(examination);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Muayene başarıyla eklendi')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Muayene eklenirken hata oluştu: $e')),
        );
      }
    }
  }

  DateTime _parseDateTime(
    String dateString,
  ) {
    // Parse date (YYYY-MM-DD format)
    final dateParts = dateString.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    return DateTime(
      year,
      month,
      day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muayene Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _patientComplaintController,
                  labelText: 'Hasta Şikayeti',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen hasta şikayetini girin';
                    }
                    return null;
                  },
                ),
                
                CustomTextFormField(
                  controller: _treatmentProcessController,
                  labelText: "Tedavi Süreci Hakkında Notlarınızı Girin",
                ),
                CustomTextFormField(
                  controller: _examinationNotesController,
                  labelText: 'Muayene Notları',
                ),
                TimePickerField(
                  controller: _nextControlTimeController,
                  labelText: "Sonraki Kontrol Zamanı",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen sonraki kontrol zamanını girin';
                    }
                    return null;
                  },
                ),
                DatePickerField(
                  controller: _examinationDateController,
                  labelText: "Muayene Tarihi",
                ),
                AppointmentTypeDropdown(onChanged: (selectedType) {
                  setState(() {
                    _selectedAppointmentType = selectedType;
                  });
                }),
                const SizedBox(height: 20),
                if (isLoadingDoctors)
                  const CircularProgressIndicator()
                else
                  DoctorDropdown(
                      onChanged: (selected) {
                        setState(() {
                          _selectedDoctor = selected;
                        });
                      },
                      selectedDoctor: _selectedDoctor,
                      labelText: 'Doktor Seçin'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveExamination,
                  child: const Text('Muayeneyi Kaydet'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
