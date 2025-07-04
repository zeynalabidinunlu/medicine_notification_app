// ignore_for_file: deprecated_member_use

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
        _showSuccessSnackBar('Kan basıncı başarıyla eklendi!');

        Navigator.of(context).pop();
      } catch (e) {
        debugPrint("UI: Hata oluştu: $e");
        debugPrint("UI: Hata tipi: ${e.runtimeType}");

        _showErrorSnackBar('Kan basıncı kaydedilirken hata oluştu: $e');
      } finally {
        setState(() {
          isSaving = false;
        });
      }
    } else {
      debugPrint("UI: Form validasyonu başarısız");
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
      appBar: _buildAppBar(theme),
      body: Column(
        children: [
          // Header Section
          _buildHeaderSection(theme, isDarkMode),

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
                      _buildFormCard(
                        theme,
                        title: 'Kan Basıncı Ölçümleri',
                        icon: Icons.favorite,
                        children: [
                          _buildCustomTextFormField(
                            theme,
                            controller: _systolicController,
                            labelText: 'Sistolik (Büyük Tansiyon)',
                            icon: Icons.arrow_upward,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Sistolik değeri boş bırakılamaz';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildCustomTextFormField(
                            theme,
                            controller: _diastolicController,
                            labelText: 'Diastolik (Küçük Tansiyon)',
                            icon: Icons.arrow_downward,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Diastolik değeri boş bırakılamaz';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildCustomTextFormField(
                            theme,
                            controller: _pulseController,
                            labelText: 'Nabız',
                            icon: Icons.monitor_heart,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nabız değeri boş bırakılamaz';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Measurement Details Card
                      _buildFormCard(
                        theme,
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
                          _buildCustomTextFormField(
                            theme,
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
                      _buildSaveButton(theme),

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

  PreferredSizeWidget _buildAppBar(ThemeData theme) {
    return AppBar(
      title: Text(
        'Kan Basıncı Ekle',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      backgroundColor: theme.primaryColor,
      foregroundColor: theme.colorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _buildHeaderSection(ThemeData theme, bool isDarkMode) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.primaryColor,
            theme.primaryColor.withOpacity(0.8),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.favorite_border,
                size: 30,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Kan Basıncı Ölçümü',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Kan basıncı ölçüm değerlerinizi aşağıdaki formu doldurarak ekleyin',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
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

  Widget _buildSaveButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isSaving ? null : _saveBloodPressure,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: isSaving
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text('Kaydediliyor...'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.save, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Kan Basıncını Kaydet',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}