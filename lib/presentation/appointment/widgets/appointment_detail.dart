// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/appbar/detail_app_bar.dart';
import 'package:medicine_notification_app/data/models/appointment/appointment_model.dart';
import 'package:intl/intl.dart';

class AppointmentDetail extends StatelessWidget {
  final Appointment? appointment;

  const AppointmentDetail({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Check if appointment data is available
    if (appointment == null) {
      return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: DetailAppBar(
          title: "Randevu Detayları",
          theme: theme,
        ),
        body: _buildEmptyState(theme),
      );
    }

    // Format date for display
    final DateFormat dateFormatter = DateFormat('dd.MM.yyyy HH:mm');
    final String appointmentDate = appointment!.appointmentDate != null
        ? dateFormatter.format(appointment!.appointmentDate!)
        : 'Belirtilmemiş';

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: DetailAppBar(title: "Randevu Detayları", theme: theme),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header Section
            _buildHeaderSection(theme, isDarkMode),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildDetailCard(
                    theme,
                    title: 'Klinik',
                    value: appointment!.clinic ?? 'Belirtilmemiş',
                    icon: Icons.local_hospital,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Hastane Adı',
                    value: appointment!.hospitalName ?? 'Belirtilmemiş',
                    icon: Icons.business,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Randevu Tarihi',
                    value: appointmentDate,
                    icon: Icons.calendar_today,
                    isHighlighted: true,
                  ),
                  const SizedBox(height: 12),

                  _buildDetailCard(
                    theme,
                    title: 'Randevu Notları',
                    value: appointment!.appointmentNotes ?? 'Belirtilmemiş',
                    icon: Icons.note_alt,
                    isExpandable: true,
                  ),

                  if (appointment!.appointmentTypes != null) ...[
                    const SizedBox(height: 12),
                    _buildDetailCard(
                      theme,
                      title: 'Randevu Tipi',
                      value: appointment!.appointmentTypes!.name,
                      icon: Icons.category,
                    ),
                  ],

                  const SizedBox(height: 24),
                  //  _buildActionButtons(theme),
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
              Icons.event_busy,
              size: 40,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Randevu Detayı Bulunamadı',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bu randevu için detay bilgisi mevcut değil.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
        ],
      ),
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
                Icons.medical_services,
                size: 30,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Randevu Detayları',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Randevu bilgilerinizi aşağıda görebilirsiniz',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.8),
              ),
            ),
          ],
        ),
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
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isHighlighted
            ? theme.primaryColor.withOpacity(0.05)
            : theme.colorScheme.surface,
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
                    color: (isHighlighted
                            ? theme.primaryColor
                            : theme.colorScheme.primary)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 20,
                    color: isHighlighted
                        ? theme.primaryColor
                        : theme.colorScheme.primary,
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
