import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/presentation/home/home_view_model.dart';
import 'package:medicine_notification_app/presentation/home/utils/delete_confirm_dialog.dart';
import 'package:medicine_notification_app/presentation/update_screen/update_screen_view.dart';
import 'package:medicine_notification_app/service/notification/flutter_local_notification_service.dart';
import 'package:provider/provider.dart';

class MedicineCardWidget extends StatelessWidget {
  final Medicine medicine;

  const MedicineCardWidget({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateScreenView(
                      id: medicine.id?.toInt() ?? 0, medicine: medicine),
                ));
          },
          borderRadius: BorderRadius.circular(16.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildUsageTypes(),
                _buildHungerSituation(),
                _buildReminderTimes(),
                _buildNotificationText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicine.name ?? 'İsimsiz İlaç',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ),
              ),
              if (medicine.description?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    medicine.description!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _showDeleteDialog(context),
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 18,
            ),
          ),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     FlutterLocalNotificationService().showNotification(
        //         title: medicine.name, body: medicine.description);
        //     debugPrint("------------------------------------------" +
        //         medicine.id.toString());
        //   },
        //   child: const Text("Test Bildirimi"),
        // ),
      ],
    );
  }

  Widget _buildUsageTypes() {
    if (medicine.usageTypes?.isEmpty != false) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Wrap(
        spacing: 6.0,
        runSpacing: 4.0,
        children: medicine.usageTypes!
            .map((usage) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFF1976D2), width: 0.5),
                  ),
                  child: Text(
                    usage.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1976D2),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildHungerSituation() {
    if (medicine.hungerSituation?.name == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.restaurant, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Text(
            medicine.hungerSituation!.name,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderTimes() {
    if (medicine.reminderTimes?.isEmpty != false)
      return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.black),
              const SizedBox(width: 6),
              Text(
                'Hatırlatma Zamanları (${medicine.reminderTimes!.length} adet)',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: medicine.reminderTimes!
                .map((time) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.teal, width: 0.5),
                      ),
                      child: Text(
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationText() {
    if (medicine.notificationText?.isEmpty != false)
      return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFFF9800), width: 0.5),
        ),
        child: Row(
          children: [
            const Icon(Icons.notifications_active,
                size: 16, color: Color(0xFFEF6C00)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                medicine.notificationText!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFEF6C00),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DeleteConfirmationDialog(
        medicineId: medicine.id?.toInt() ?? 0,
        medicineName: medicine.name ?? 'Bu ilaç',
        onConfirm: () => _deleteMedicine(context),
      ),
    );
  }

  Future<void> _deleteMedicine(BuildContext context) async {
    final flutterLocalNotificationService = FlutterLocalNotificationService();
    try {
      await context
          .read<HomeViewModel>()
          .deleteMedicine(medicine.id?.toInt() ?? 0);
      await flutterLocalNotificationService
          .cancelNotificationById(medicine.id!.toInt());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('${medicine.name ?? 'İlaç'} başarıyla silindi'),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text('İlaç silinirken hata oluştu: ${e.toString()}'),
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
