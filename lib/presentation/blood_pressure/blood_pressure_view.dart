import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/common_page_transition.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/blood_pressure_view_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/widgets/adding_blood_pressure.dart';
import 'package:provider/provider.dart';

class BloodPressureView extends StatefulWidget {
  const BloodPressureView({super.key});

  @override
  State<BloodPressureView> createState() => _BloodPressureViewState();
}

class _BloodPressureViewState extends State<BloodPressureView> {
  @override
  void initState() {
    super.initState();
    // Sayfa açıldığında veriyi yükle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BloodPressureViewModel>().loadBloodPressures();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kan Basıncı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await context.fadeToPage(const AddingBloodPressure());
              // Yeni veri eklendikten sonra listeyi güncelle
              if (mounted) {
                context.read<BloodPressureViewModel>().loadBloodPressures();
              }
            },
          ),
        ],
      ),
      body: Consumer<BloodPressureViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hata: ${viewModel.errorMessage}'),
                  ElevatedButton(
                    onPressed: () => viewModel.loadBloodPressures(),
                    child: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.bloodPressures.isEmpty) {
            return const Center(
              child: Text('Kan basıncı verisi bulunamadı.'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.loadBloodPressures(),
            child: ListView.builder(
              itemCount: viewModel.bloodPressures.length,
              itemBuilder: (context, index) {
                final bloodPressure = viewModel.bloodPressures[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      'Sistolik: ${bloodPressure.systolic}, Diastolik: ${bloodPressure.diastolic}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nabız: ${bloodPressure.pulse}'),
                        Text(
                            'Tarih: ${bloodPressure.measurementDate?.toString().split(' ')[0] ?? 'Tarih yok'}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () =>
                          _showDeleteDialog(context, viewModel, bloodPressure),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, BloodPressureViewModel viewModel,
      BloodPressure bloodPressure) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Silme İşlemi'),
        content: const Text(
            'Bu kan basıncı kaydını silmek istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await viewModel.deleteBloodPressure(bloodPressure.id!);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kan basıncı kaydı silindi')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Hata: $e')),
                  );
                }
              }
            },
            child: const Text('Sil', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
