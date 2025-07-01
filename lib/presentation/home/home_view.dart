import 'package:flutter/material.dart';
import 'package:medicine_notification_app/presentation/add_medicine/add_medicine_view.dart';
import 'package:medicine_notification_app/presentation/appointment/appointment_view.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/blood_pressure_view.dart';
import 'package:medicine_notification_app/presentation/doctors/doctors_view.dart';
import 'package:medicine_notification_app/presentation/examination/examination_view.dart';
import 'package:medicine_notification_app/presentation/home/widgets/home_page_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePageContent(),
    AddMedicineView(),
    AppointmentView(),
    ExaminationView(),
    DoctorsView(),
    BloodPressureView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined), label: "İlaç Ekle"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: "Randevular"),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined),
              label: "Muayeneler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Doktorlarım"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart_outlined), label: "Kan Basıncı"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
