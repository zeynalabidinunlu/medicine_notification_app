import 'package:flutter/material.dart';
import 'package:medicine_notification_app/presentation/home/home_view_model.dart';
import 'package:medicine_notification_app/presentation/home/widgets/empty_medicine_widget.dart';
import 'package:medicine_notification_app/presentation/home/widgets/medicine_list_widget.dart';

import 'package:provider/provider.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().loadMedicines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoş Geldiniz"),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hata: ${viewModel.error}'),
                  ElevatedButton(
                    onPressed: () => viewModel.loadMedicines(),
                    child: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.medicines.isEmpty) {
            return const EmptyMedicineWidget();
          }

          return MedicineListWidget(medicines: viewModel.medicines);
        },
      ),
    );
  }
}