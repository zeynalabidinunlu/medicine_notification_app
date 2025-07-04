// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/detail/appbar/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/header/detail_header_section.dart';
import 'package:medicine_notification_app/common/detail/save/detail_save_button.dart';
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
        _showSuccessSnackBar('Doktor başarıyla kaydedildi!');

        Navigator.of(context).pop();
      } catch (e) {
        _showErrorSnackBar('Doktor kaydedilirken hata oluştu: $e');
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

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
                      _buildFormCard(
                        theme,
                        title: 'Doktor Bilgileri',
                        icon: Icons.person_outline,
                        children: [
                          _buildCustomTextFormField(
                            theme,
                            controller: _doctorNameController,
                            labelText: 'Doktor Adı',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Doktor adı gerekli';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Workplace Information Card
                      _buildFormCard(
                        theme,
                        title: 'Çalışma Yeri Bilgileri',
                        icon: Icons.local_hospital,
                        children: [
                          _buildCustomTextFormField(
                            theme,
                            controller: _hospitalNameController,
                            labelText: 'Hastane Adı',
                            icon: Icons.business,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Hastane adı gerekli';
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Klinik adı gerekli';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Schedule Information Card
                      _buildFormCard(
                        theme,
                        title: 'Çalışma Programı',
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
    // ignore: unused_element_parameter
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
