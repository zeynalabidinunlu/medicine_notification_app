import 'package:flutter/material.dart';
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

  List<Doctor> _doctors = [];
  Doctor? _selectedDoctor;
  bool isLoadingDoctors = true;

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
        _doctors = doctorsList;
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _examinationDateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
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
                  TextFormField(
                    controller: _patientComplaintController,
                    decoration: const InputDecoration(
                        labelText: 'Hasta Şikayetinizi Girin'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen hasta şikayetini girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _treatmentProcessController,
                    decoration: const InputDecoration(
                        labelText: 'Tedavi Sürecini Girin'),
                  ),
                  TextFormField(
                    controller: _examinationNotesController,
                    decoration: const InputDecoration(
                        labelText: 'Muayene Notlarını Girin'),
                  ),
                  TextFormField(
                    controller: _nextControlTimeController,
                    decoration: const InputDecoration(
                        labelText:
                            'Sonraki Kontrol Zamanını Girin (YYYY-MM-DD)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen sonraki kontrol zamanını girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _examinationDateController,
                    decoration: const InputDecoration(
                        labelText: 'Muayene Tarihini Girin (YYYY-MM-DD)'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen muayene tarihini girin';
                      }
                      return null;
                    },
                    onTap: () => _selectDate(context),
                  ),
                  DropdownButtonFormField<AppointmentTypes>(
                    value: _selectedAppointmentType,
                    decoration: const InputDecoration(
                        labelText: 'Muayene Türünü Seçin'),
                    items: AppointmentTypes.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAppointmentType = value;
                      });
                    },
                  ),
                  if (isLoadingDoctors)
                    const CircularProgressIndicator()
                  else
                    DropdownButtonFormField<Doctor>(
                      value: _selectedDoctor,
                      decoration:
                          const InputDecoration(labelText: 'Doktor Seçin'),
                      items: _doctors.map((doctor) {
                        return DropdownMenuItem(
                          value: doctor,
                          child: Text(doctor.name.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDoctor = value;
                        });
                      },
                    ),
                const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveExamination,
                    child: const Text('Muayeneyi Kaydet'),
                  ),
                ],
              ),
            ),),
      ),
    );
  }
}
