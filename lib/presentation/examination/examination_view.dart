import 'package:flutter/material.dart';
import 'package:medicine_notification_app/common/common_page_transition.dart';
import 'package:medicine_notification_app/common/widgets/common_list_tile.dart';
import 'package:medicine_notification_app/presentation/examination/widgets/adding_examination.dart';
import 'package:medicine_notification_app/presentation/examination/examination_view_model.dart';
import 'package:medicine_notification_app/presentation/examination/widgets/examination_detail.dart';
import 'package:provider/provider.dart';

class ExaminationView extends StatelessWidget {
  const ExaminationView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ExaminationViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muayeneler'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.fadeToPage(const AddingExamination());
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: vm.getAllExaminations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Muayene bulunamadı.'));
          } else {
            final examinations = snapshot.data!;
            return ListView.builder(
              itemCount: examinations.length,
              itemBuilder: (context, index) {
                final examination = examinations[index];
                return CommonListTile(
                  onTap: () {
                    context.fadeToPage(
                      ExaminationDetail(examination: examination),
                    );
                  },
                  leadingIcon: Icons.medical_services,
                  trailingIcon: Icons.arrow_forward_ios,
                  title: examination.patientComplaint.toString(),
                  subtitle: examination.examinationDate.toString(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
