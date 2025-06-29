import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final int medicineId;
  final String medicineName;
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({
    super.key,
    required this.medicineName,
    required this.onConfirm,
    required this.medicineId
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
          SizedBox(width: 8),
          Text('İlaç Sil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
      content: Text(
        '$medicineName kalıcı olarak silinecek. Bu işlem geri alınamaz. Emin misiniz?',
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('İptal', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text('Sil'),
        ),
      ],
    );
  }
}