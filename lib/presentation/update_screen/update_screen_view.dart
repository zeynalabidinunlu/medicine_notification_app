import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/enum/enums.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/presentation/add_medicine/add_medicine_view_model.dart';
import 'package:medicine_notification_app/service/notification/flutter_local_notification_service.dart';
import 'package:medicine_notification_app/utils/widgets/selection_chip.dart';
import 'package:provider/provider.dart';

class UpdateScreenView extends StatefulWidget {
  final Medicine medicine;
  const UpdateScreenView({super.key, required int id, required this.medicine});

  @override
  State<UpdateScreenView> createState() => _UpdateScreenViewState();
}

class _UpdateScreenViewState extends State<UpdateScreenView> {
  List<DateTime> reminderList = [];
  List<UsageTypes> selectedUsageTypes = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController notificationController = TextEditingController();
  TextEditingController pillCountController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Color hintTextColor = Colors.grey.shade500;
  final Color textFieldFillColor = Colors.grey.shade200;
  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  );

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.medicine.name);
    descriptionController =
        TextEditingController(text: widget.medicine.description);
    notificationController =
        TextEditingController(text: widget.medicine.notificationText);
    pillCountController = TextEditingController(
        text: widget.medicine.numberOfPills?.toString() ?? '0');
    reminderList = List.from(widget.medicine.reminderTimes ?? []);
    selectedUsageTypes = widget.medicine.usageTypes ?? [];
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    notificationController.dispose();
    pillCountController.dispose();
    super.dispose();
  }

  Future<void> _updateMedicine() async {
    if (_formKey.currentState!.validate()) {
      final viewModel =
          Provider.of<AddMedicineViewModel>(context, listen: false);

      if (viewModel.selectedUsageTypes.isEmpty ||
          viewModel.selectedHungerSituations == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tüm alanları doldurunuz')),
        );
        return;
      }

      // Güncellenmiş ilaç nesnesi
      final updatedMedicine = widget.medicine
        ..name = nameController.text.trim()
        ..description = descriptionController.text.trim()
        ..usageTypes = viewModel.selectedUsageTypes
        ..hungerSituation = viewModel.selectedHungerSituations!
        ..notificationText = notificationController.text.trim()
        ..reminderTimes = reminderList
        ..numberOfPills = int.tryParse(pillCountController.text) ?? 0;

      try {
        await viewModel.updateMedicine(
          widget.medicine.id?.toInt() ?? 0,
          updatedMedicine,
        );

        // Bildirimleri güncelle
        for (int i = 0; i < updatedMedicine.reminderTimes!.length; i++) {
          final reminder = updatedMedicine.reminderTimes![i];
          await FlutterLocalNotificationService().scheduledNotification(
            id: i + 1,
            title: updatedMedicine.name ?? "",
            body: updatedMedicine.notificationText ?? "",
            hour: reminder.hour,
            minute: reminder.minute,
          );
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('İlaç güncellendi')),
          );
          Navigator.pop(context); // Önceki sayfaya dön
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Güncelleme hatası: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddMedicineViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("İlacı Güncelle"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'İlaç adı boş olamaz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "İlaç Adı",
                  hintStyle: TextStyle(color: hintTextColor),
                  filled: true,
                  fillColor: textFieldFillColor,
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                ),
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Açıklama',
                  hintStyle: TextStyle(color: hintTextColor),
                  filled: true,
                  fillColor: textFieldFillColor,
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                ),
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Kullanım Vakitleri",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Consumer<AddMedicineViewModel>(
                builder: (context, viewModel, child) {
                  return Wrap(
                    spacing: 10.0,
                    children: UsageTypes.values.map((type) {
                      final isSelected =
                          viewModel.selectedUsageTypes.contains(type);
                      return ChoiceChip(
                        label: Text(type.name.toUpperCase()),
                        selected: isSelected,
                        onSelected: (_) => viewModel.toggleUsageType(type),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Açlık Durumu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<AddMedicineViewModel>(
                builder: (context, value, child) {
                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: <Widget>[
                      SelectionChip(
                        label: "Aç Karınla",
                        isSelected: viewModel.selectedHungerSituation ==
                            HungerSituation.AC,
                        onTap: () => viewModel
                            .setHungerSituationTypes(HungerSituation.AC),
                      ),
                      SelectionChip(
                        label: "Tok Karınla",
                        isSelected: viewModel.selectedHungerSituation ==
                            HungerSituation.TOK,
                        onTap: () => viewModel
                            .setHungerSituationTypes(HungerSituation.TOK),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Bildirim Metini",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: notificationController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bildirim metni boş olamaz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Bildirim Metinini Giriniz",
                  hintStyle: TextStyle(color: hintTextColor),
                  filled: true,
                  fillColor: textFieldFillColor,
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Bildirim Zamanlarını Düzenleyin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              // Hatırlatma zamanları listesi
              SizedBox(
                height: 100,
                child: reminderList.isEmpty
                    ? const Center(child: Text('Henüz zaman eklenmedi'))
                    : ListView.builder(
                        itemCount: reminderList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              '${reminderList[index].hour}:${reminderList[index].minute.toString().padLeft(2, '0')}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  reminderList.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      reminderList.add(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        time.hour,
                        time.minute,
                      ));
                    });
                  }
                },
                child: const Center(child: Text('Zaman Ekle')),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Toplam Hap Sayısı",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextFormField(
                controller: pillCountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Hap sayısı boş olamaz';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Geçerli bir sayı giriniz';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Toplam Hap Sayısı",
                  hintStyle: TextStyle(color: hintTextColor),
                  filled: true,
                  fillColor: textFieldFillColor,
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _updateMedicine,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'İlacı Güncelle',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
