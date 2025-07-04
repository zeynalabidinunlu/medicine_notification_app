// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_notification_app/common/detail/detail_app_bar.dart';
import 'package:medicine_notification_app/common/detail/detail_header_section.dart';
import 'package:medicine_notification_app/data/models/examination/examination_model.dart';

class ExaminationDetail extends StatelessWidget {
  final Examination? examination;

  const ExaminationDetail({super.key, required this.examination});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Check if examination data is available
    if (examination == null) {
      return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: DetailAppBar(title: 'Muayene Detayları', theme: theme),
        body: _buildEmptyState(theme),
      );
    }

    // Format dates for display
    final DateFormat dateFormatter = DateFormat('dd.MM.yyyy HH:mm');
    final String examinationDate = examination!.examinationDate != null
        ? dateFormatter.format(examination!.examinationDate!)
        : 'Belirtilmemiş';
    final String nextControlTime = examination!.nextControlTime != null
        ? dateFormatter.format(examination!.nextControlTime!)
        : 'Belirtilmemiş';

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(title: 'Muayene Detayları', theme: theme),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header Section
           DetailHeaderSection(
              theme: theme,
              title: 'Muayene Detayları',
              subtitle: 'Muayene bilgilerinizi aşağıda görebilirsiniz',
              icon: Icon(
                Icons.medical_information,
                size: 30,
                color: theme.colorScheme.onPrimary,
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildDetailCard(
                    theme,
                    title: 'Hasta Şikayeti',
                    value: examination!.patientComplaint ?? 'Belirtilmemiş',
                    icon: Icons.record_voice_over,
                    isExpandable: true,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Muayene Tarihi',
                    value: examinationDate,
                    icon: Icons.calendar_today,
                    isHighlighted: true,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Tedavi Süreci',
                    value: examination!.treatmentProcess ?? 'Belirtilmemiş',
                    icon: Icons.healing,
                    isExpandable: true,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Sonraki Kontrol Zamanı',
                    value: nextControlTime,
                    icon: Icons.schedule,
                    isHighlighted: nextControlTime != 'Belirtilmemiş',
                    cardColor: nextControlTime != 'Belirtilmemiş'
                        ? Colors.orange.withOpacity(0.1)
                        : null,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Muayene Notları',
                    value: examination!.examinationNotes ?? 'Belirtilmemiş',
                    icon: Icons.note_alt,
                    isExpandable: true,
                  ),

                  if (examination!.appointmentTypes != null) ...[
                    const SizedBox(height: 12),
                    _buildDetailCard(
                      theme,
                      title: 'Randevu Tipi',
                      value: examination!.appointmentTypes!.name,
                      icon: Icons.category,
                    ),
                  ],

                  const SizedBox(height: 24),
                  //   _buildActionButtons(theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.medical_information_outlined,
              size: 40,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Muayene Detayı Bulunamadı',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bu muayene için detay bilgisi mevcut değil.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(
    ThemeData theme, {
    required String title,
    required String value,
    required IconData icon,
    bool isHighlighted = false,
    bool isExpandable = false,
    Color? cardColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor ??
            (isHighlighted
                ? theme.primaryColor.withOpacity(0.05)
                : theme.colorScheme.surface),
        borderRadius: BorderRadius.circular(16),
        border: isHighlighted
            ? Border.all(color: theme.primaryColor.withOpacity(0.3))
            : null,
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getIconColor(icon, theme, isHighlighted)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: _getIconColor(icon, theme, isHighlighted),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isHighlighted
                          ? theme.primaryColor
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
                height: isExpandable ? 1.5 : 1.2,
              ),
              maxLines: isExpandable ? null : 2,
              overflow: isExpandable ? null : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor(IconData icon, ThemeData theme, bool isHighlighted) {
    if (isHighlighted) return theme.primaryColor;

    switch (icon) {
      case Icons.record_voice_over:
        return Colors.blue;
      case Icons.calendar_today:
        return Colors.green;
      case Icons.healing:
        return Colors.purple;
      case Icons.schedule:
        return Colors.orange;
      case Icons.note_alt:
        return Colors.teal;
      case Icons.category:
        return Colors.indigo;
      default:
        return theme.colorScheme.primary;
    }
  }

  // ignore: unused_element
  Widget _buildActionButtons(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Add edit functionality
            },
            icon: const Icon(Icons.edit),
            label: const Text('Düzenle'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Add reminder functionality
            },
            icon: const Icon(Icons.notifications),
            label: const Text('Hatırlatıcı'),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.primaryColor,
              side: BorderSide(color: theme.primaryColor),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
