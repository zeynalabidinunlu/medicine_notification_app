import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/models/medicine_model.dart';
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
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              label: "İlaç Ekle")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Ana sayfa içeriği için ayrı widget
// import 'package:flutter/material.dart';
// import 'package:isar/isar.dart'; // Make sure this import is present
// import 'package:medicine_notification_app/data/enum/enums.dart'; // Your enums
// import 'package:medicine_notification_app/data/models/medicine_model.dart'; // Your Medicine model

// Assuming Isar is initialized globally or passed down.
// A common way to get an Isar instance is through a service or a global variable.
// For simplicity in this example, let's assume you have a way to get the Isar instance.
// For example:
// late final Isar isarInstance; // Initialize this in your main.dart or a service

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

  // Function to get the Isar instance.
  // Replace this with your actual Isar instance retrieval logic.
  Future<Isar> _getIsarInstance() async {
    // This is a placeholder. In a real app, you would have already opened Isar.
    // Example: return await Isar.open([MedicineSchema]);
    // For demonstration, let's assume it's accessible globally or via a service.
    // If you initialize Isar in main, you might access it like:
    // return Isar.getInstance()!; or your specific method.

    // **IMPORTANT:** You must have initialized Isar somewhere in your app (e.g., main.dart)
    // before trying to access it here.
    // Example of how you might initialize it in main.dart:
    /*
    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      final dir = await getApplicationDocumentsDirectory();
      isarInstance = await Isar.open(
        [MedicineSchema],
        directory: dir.path,
      );
      runApp(const MyApp());
    }
    */
    // If you have a global Isar instance, you can simply return it.
    // For this example, let's throw an error if it's not initialized,
    // to emphasize that it needs to be set up first.
    if (!Isar.instanceNames.contains('default')) {
      throw Exception("Isar not initialized. Call Isar.open() first.");
    }
    return Isar.getInstance()!;
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
                          'Kullanım Şekli: ${medicine.usageTypes?.name ?? 'Belirtilmemiş'}',
                          style: const TextStyle(fontSize: 14),
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
                        if (medicine.reminderTimes != null && medicine.reminderTimes!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'Hatırlatma Zamanları: ${medicine.reminderTimes!.map((time) => '${time.hour}:${time.minute.toString().padLeft(2, '0')}').join(', ')}',
                              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
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