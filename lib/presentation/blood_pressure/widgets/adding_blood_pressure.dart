import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/widgets/custom_text_form_field.dart';
import 'package:medicine_notification_app/common/widgets/date_picker_field.dart';
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _systolicController,
              labelText: 'Sistolik (Büyük Tansiyon)',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Sistolik değeri boş bırakılamaz';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: _diastolicController,
              labelText: 'Diastolik (Küçük Tansiyon)',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Diastolik değeri boş bırakılamaz';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: _pulseController,
              labelText: 'Nabız',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nabız değeri boş bırakılamaz';
                }
                return null;
              },
            ),
            DatePickerField(
              controller: _measurementDateController,
              labelText: "Ölçüm Tarihi",
            ),
            CustomTextFormField(
              controller: _notesController,
              labelText: 'Notlar',
              maxLines: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _saveBloodPressure();
                  },
                  child: const Text('Ekle'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
