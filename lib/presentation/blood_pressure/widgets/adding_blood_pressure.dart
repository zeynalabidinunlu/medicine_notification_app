import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/blood_pressure_view_model.dart';
import 'package:provider/provider.dart';

class AddingBloodPressure extends StatefulWidget {
  const AddingBloodPressure({super.key});

  @override
  State<AddingBloodPressure> createState() => _AddingBloodPressureState();
}

class _AddingBloodPressureState extends State<AddingBloodPressure> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _pulseController = TextEditingController();
  final TextEditingController _measurementDateController =
      TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _pulseController.dispose();
    _measurementDateController.dispose();
    super.dispose();
  }

  void _saveBloodPressure() async {
    debugPrint("UI: Kaydet butonuna basıldı");

    if (_formKey.currentState!.validate()) {
      try {
        debugPrint("UI: Form validasyonu geçti");

        final vm = context.read<BloodPressureViewModel>();

        final bloodPressure = BloodPressure()
          ..systolic = double.parse(_systolicController.text)
          ..diastolic = double.parse(_diastolicController.text)
          ..pulse = double.parse(_pulseController.text)
          ..notes = _notesController.text
          ..measurementDate = DateTime.parse(_measurementDateController.text);

        await vm.addBloodPressure(bloodPressure);

        debugPrint("UI: ViewModel'e başarıyla eklendi");

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Kan basıncı başarıyla eklendi'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        debugPrint("UI: Hata oluştu: $e");
        debugPrint("UI: Hata tipi: ${e.runtimeType}");

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hata: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } else {
      debugPrint("UI: Form validasyonu başarısız");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kan Basıncı Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _systolicController,
                decoration: const InputDecoration(labelText: 'Sistolik'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sistolik değeri boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _diastolicController,
                decoration: const InputDecoration(labelText: 'Diastolik'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Diastolik değeri boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pulseController,
                decoration: const InputDecoration(labelText: 'Nabız'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nabız değeri boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _measurementDateController,
                decoration: const InputDecoration(
                  labelText: 'Ölçüm Tarihi',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true, // Manuel girişi engelleyin
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    _measurementDateController.text =
                        date.toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ölçüm tarihi boş bırakılamaz';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Ölçüm Notları'),
                maxLines: 3,
              ),
              ElevatedButton(
                onPressed: () {
                  _saveBloodPressure();
                },
                child: const Text('Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
