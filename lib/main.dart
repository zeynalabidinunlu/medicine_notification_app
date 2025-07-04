import 'package:flutter/material.dart';
import 'package:medicine_notification_app/init/database/database_manager.dart';
import 'package:medicine_notification_app/presentation/add_medicine/add_medicine_view_model.dart';
import 'package:medicine_notification_app/presentation/appointment/appointment_view_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/blood_pressure_view_model.dart';
import 'package:medicine_notification_app/presentation/doctors/doctors_view_model.dart';
import 'package:medicine_notification_app/presentation/examination/examination_view_model.dart';
import 'package:medicine_notification_app/presentation/home/home_view_model.dart';
import 'package:medicine_notification_app/presentation/home/home_view.dart';
import 'package:medicine_notification_app/repository/appointment/appointment_repository.dart';
import 'package:medicine_notification_app/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:medicine_notification_app/repository/doctors/doctors_repository.dart';
import 'package:medicine_notification_app/repository/examination/examination_repository.dart';
import 'package:medicine_notification_app/repository/medicine/medicine_repository.dart';
import 'package:medicine_notification_app/service/notification/flutter_local_notification_service.dart';
import 'package:medicine_notification_app/theme/material_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLocalNotificationService().initNotification();

  await DatabaseManager().db;
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => DatabaseManager()),
        ChangeNotifierProvider(
          create: (context) =>
              AddMedicineViewModel(medicineRepository: MedicineRepository()),
        ),
        Provider<MedicineRepository>(
          create: (_) => MedicineRepository(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) =>
              HomeViewModel(context.read<MedicineRepository>()),
        ),
        Provider<DoctorsRepository>(
          create: (context) => DoctorsRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              DoctorsViewModel(context.read<DoctorsRepository>()),
        ),
        Provider<DoctorsRepository>(create: (_) => DoctorsRepository()),
        Provider<AppointmentRepository>(create: (_) => AppointmentRepository()),
        ChangeNotifierProvider<AppointmentViewModel>(
          create: (context) => AppointmentViewModel(
            context.read<AppointmentRepository>(),
          ),
        ),
        Provider<ExaminationRepository>(create: (_) => ExaminationRepository()),
        ChangeNotifierProvider<ExaminationViewModel>(
          create: (context) => ExaminationViewModel(
            context.read<ExaminationRepository>(),
          ),
        ),
        Provider<BloodPressureRepository>(
            create: (_) => BloodPressureRepository()),
        ChangeNotifierProvider(
          create: (context) =>
              BloodPressureViewModel(context.read<BloodPressureRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(Theme.of(context).textTheme);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: materialTheme.light(),
        // theme: ThemeData(
        //   primaryColor: const Color(0xFF4CAF50), // A shade of green
        //   scaffoldBackgroundColor: Colors.white,
        //   appBarTheme: const AppBarTheme(
        //     backgroundColor: Colors.white,
        //     foregroundColor: Colors.black,
        //   ),
        //   textSelectionTheme: const TextSelectionThemeData(
        //     cursorColor: Color(0xFF4CAF50),
        //   ),
        //   // Default styling for elevated button for consistency
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color(0xFF4CAF50),
        //       foregroundColor: Colors.white,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0),
        //       ),
        //       textStyle: const TextStyle(fontSize: 18.0),
        //     ),
        //   ),
        //   chipTheme: const ChipThemeData(
        //       elevation: 20.0,
        //       checkmarkColor: Colors.black,
        //       selectedColor: Color(0xFFE8F5E0)),
        //   cardTheme: CardThemeData(
        //     elevation: 2,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(16.0),
        //     ),
        //     color: Colors.white,
        //   ),
        //   useMaterial3: true,
        // ),
        darkTheme: materialTheme.light(),
        home: const HomeView());
  }
}
