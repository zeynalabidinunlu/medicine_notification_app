import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
import 'package:medicine_notification_app/data/service/isar_service.dart';
import 'package:medicine_notification_app/presentation/add_medicine/add_medicine_view.dart';
import 'package:isar/isar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // Ana sayfa içeriği için ayrı widget
  final List<Widget> widgetOptions = const [
    HomePageContent(), // HomeView() yerine HomePageContent() kullanın
    AddMedicineView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined), label: "İlaç Ekle")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  late Future<List<Medicine>> _medicinesFuture;

  @override
  void initState() {
    super.initState();
    _medicinesFuture = _getMedicines();
  }

  Future<Isar> _getIsarInstance() async {
    return IsarService.openDB();
  }

  Future<List<Medicine>> _getMedicines() async {
    final isar = await _getIsarInstance();
    return await isar.medicines.where().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoş Geldiniz"),
      ),
      body: FutureBuilder<List<Medicine>>(
        future: _medicinesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medication_liquid_outlined, // More relevant icon
                    size: 80,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Henüz ilaç eklenmedi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Yeni bir ilaç eklemek için + butonuna dokunun.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            // Data has been loaded successfully
            final medicines = snapshot.data!;
            return ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicine.name ?? 'İsimsiz İlaç',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Açıklama: ${medicine.description ?? 'Yok'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Kullanım Şekli: ${medicine.usageTypes != null && medicine.usageTypes!.isNotEmpty ? medicine.usageTypes!.map((e) => e.name).join(', ') : 'Belirtilmemiş'}',
                        ),
                        Text(
                          'Açlık Durumu: ${medicine.hungerSituation?.name ?? 'Belirtilmemiş'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Bildirim Metni: ${medicine.notificationText ?? 'Yok'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Hatırlatma Sayısı: ${medicine.reminderTimes?.length ?? 0}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        if (medicine.reminderTimes != null &&
                            medicine.reminderTimes!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'Hatırlatma Zamanları: ${medicine.reminderTimes!.map((time) => '${time.hour}:${time.minute.toString().padLeft(2, '0')}').join(', ')}',
                              style: const TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                          ),
                        Text(
                          'Hap Sayısı: ${medicine.numberOfPills ?? 'Belirtilmemiş'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
