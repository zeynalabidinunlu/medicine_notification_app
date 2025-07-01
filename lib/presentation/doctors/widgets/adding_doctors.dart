import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/doctor/doctor_model.dart';
import 'package:medicine_notification_app/presentation/doctors/doctors_view_model.dart';
import 'package:provider/provider.dart';

class AddingDoctors extends StatefulWidget {
  const AddingDoctors({super.key});

  @override
  State<AddingDoctors> createState() => _AddingDoctorsState();
}

class _AddingDoctorsState extends State<AddingDoctors> {
  Days? _selectedDayOff;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();

  @override
  void dispose() {
    _doctorNameController.dispose();
    _clinicNameController.dispose();

    super.dispose();
  }

  void _saveDoctor() async {
    if (_formKey.currentState!.validate()) {
      final vm = context.read<DoctorsViewModel>();
      final doctor = Doctor()
        ..name = _doctorNameController.text
        ..klinik = _clinicNameController.text
        ..daysOff = _selectedDayOff;
      await vm.saveDoctor(doctor);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doktor başarıyla eklendi!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doktor Ekle'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                controller: _doctorNameController,
                labelText: 'Doktor Adı',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Doktor adı gerekli';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: _clinicNameController,
                labelText: 'Klinik Adı',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Klinik adı gerekli';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: _hospitalNameController,
                labelText: 'Hastane Adı',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Hastane adı gerekli';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<Days>(
                value: _selectedDayOff,
                decoration: const InputDecoration(
                  labelText: 'İzinli Gün',
                  border: OutlineInputBorder(),
                ),
                items: Days.values.map((Days day) {
                  return DropdownMenuItem<Days>(
                    value: day,
                    child: Text(day.name),
                  );
                }).toList(),
                onChanged: (Days? newValue) {
                  setState(() {
                    _selectedDayOff = newValue;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveDoctor,
                child: const Text('Doktoru Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
