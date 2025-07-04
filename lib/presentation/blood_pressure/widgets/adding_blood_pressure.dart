// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/detail_custom_text_form_field.dart';
import 'package:medicine_notification_app/common/detail/detail_form_card.dart';
import 'package:medicine_notification_app/common/detail/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/detail_save_button.dart';
import 'package:medicine_notification_app/common/show_error_snack_bar.dart';
import 'package:medicine_notification_app/common/show_success_snack_bar.dart';
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

  // State variables
  bool isSaving = false;

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _pulseController.dispose();
    _measurementDateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveBloodPressure() async {
    debugPrint("UI: Kaydet butonuna basıldı");

    if (_formKey.currentState!.validate()) {
      setState(() {
        isSaving = true;
      });

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

        // Show success message
        showSuccessSnackBar(context, 'Kan basıncı başarıyla eklendi!');

        Navigator.of(context).pop();
      } catch (e) {
        debugPrint("UI: Hata oluştu: $e");
        debugPrint("UI: Hata tipi: ${e.runtimeType}");

        showErrorSnackBar(context, 'Kan basıncı kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
      }
    } else {
      debugPrint("UI: Form validasyonu başarısız");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(title: 'Kan Basıncı Ekle', theme: theme),
      body: Column(
        children: [
          // Header Section
          DetailHeaderSection(
            title: 'Kan Basıncı Ölçümü',
            subtitle:
                'Kan basıncı ölçüm değerlerinizi aşağıdaki formu doldurarak ekleyin',
            theme: theme,
            icon: Icon(
              Icons.favorite_border,
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
                      // Blood Pressure Measurements Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Kan Basıncı Ölçümleri',
                        icon: Icons.favorite,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _systolicController,
                            labelText: 'Sistolik (Büyük Tansiyon)',
                            icon: Icons.arrow_upward,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Sistolik değeri boş bırakılamaz';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu !!';
                            },
                          ),
                          const SizedBox(height: 16),
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _diastolicController,
                            labelText: 'Diastolik (Küçük Tansiyon)',
                            icon: Icons.arrow_downward,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Diastolik değeri boş bırakılamaz';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                          const SizedBox(height: 16),
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _pulseController,
                            labelText: 'Nabız',
                            icon: Icons.monitor_heart,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nabız değeri boş bırakılamaz';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Measurement Details Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Ölçüm Detayları',
                        icon: Icons.event_note,
                        children: [
                          DatePickerField(
                            controller: _measurementDateController,
                            labelText: "Ölçüm Tarihi",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen ölçüm tarihini seçin';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _notesController,
                            labelText: 'Notlar',
                            icon: Icons.note_add,
                            maxLines: 3,
                            isOptional: true,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Save Button
                      DetailSaveButton(
                          onPressed: _saveBloodPressure,
                          loadingText: 'Kaydediliyor ...',
                          savedText: 'Kan Basıncını Kaydet',
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
}
