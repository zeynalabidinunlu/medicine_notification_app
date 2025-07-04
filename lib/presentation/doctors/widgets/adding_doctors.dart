// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/detail_custom_text_form_field.dart';
import 'package:medicine_notification_app/common/detail/detail_form_card.dart';
import 'package:medicine_notification_app/common/detail/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/detail_save_button.dart';
import 'package:medicine_notification_app/common/show_error_snack_bar.dart';
import 'package:medicine_notification_app/common/show_success_snack_bar.dart';
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
  final _formKey = GlobalKey<FormState>();
  Days? _selectedDayOff;

  // Controllers
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();

  // State variables
  bool isSaving = false;

  @override
  void dispose() {
    _doctorNameController.dispose();
    _clinicNameController.dispose();
    _hospitalNameController.dispose();
    super.dispose();
  }

  void _saveDoctor() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSaving = true;
      });

      try {
        final vm = context.read<DoctorsViewModel>();
        final doctor = Doctor()
          ..name = _doctorNameController.text
          ..klinik = _clinicNameController.text
          ..daysOff = _selectedDayOff;

        await vm.saveDoctor(doctor);

        // Show success message
        showSuccessSnackBar(context, 'Doktor başarıyla kaydedildi!');

        Navigator.of(context).pop();
      } catch (e) {
        showErrorSnackBar(context, 'Doktor kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(title: "Doktor Ekle", theme: theme),
      body: Column(
        children: [
          // Header Section
          DetailHeaderSection(
            title: 'Yeni Doktor',
            subtitle: 'Doktor bilgilerini aşağıdaki formu doldurarak ekleyin',
            theme: theme,
            icon: Icon(
              Icons.person_add_alt_1_outlined,
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
                      // Doctor Personal Information Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Doktor Bilgileri',
                        icon: Icons.person_outline,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _doctorNameController,
                            labelText: 'Doktor Adı',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Doktor adı gerekli';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Workplace Information Card
                      DetailFormCard(
                        theme: theme,
                        title: 'Çalışma Yeri Bilgileri',
                        icon: Icons.local_hospital,
                        children: [
                          DetailCustomTextFormField(
                            theme: theme,
                            controller: _hospitalNameController,
                            labelText: 'Hastane Adı',
                            icon: Icons.business,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Hastane adı gerekli';
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Klinik adı gerekli';
                              }
                              return 'Beklenmeyen Bir Hata Oluştu';
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Schedule Information Card
                      DetailFormCard(
                        theme: theme,
                        title: 'İzinli Olduğu Gün',
                        icon: Icons.schedule,
                        children: [
                          _buildDayOffDropdown(theme),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Save Button
                      DetailSaveButton(
                          onPressed: _saveDoctor,
                          loadingText: 'Kaydediliyor ...',
                          savedText: 'Doktoru Kaydet',
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

  Widget _buildDayOffDropdown(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<Days>(
        value: _selectedDayOff,
        decoration: InputDecoration(
          labelText: 'İzinli Gün',
          prefixIcon: Icon(Icons.event_busy, color: theme.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.colorScheme.surface,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        items: Days.values.map((Days day) {
          return DropdownMenuItem<Days>(
            value: day,
            child: Text(
              day.name,
              style: theme.textTheme.bodyMedium,
            ),
          );
        }).toList(),
        onChanged: (Days? newValue) {
          setState(() {
            _selectedDayOff = newValue;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Lütfen izinli gün seçin';
          }
          return null;
        },
      ),
    );
  }
}
