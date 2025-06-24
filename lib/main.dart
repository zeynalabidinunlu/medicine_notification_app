import 'package:flutter/material.dart';
import 'package:medicine_notification_app/data/service/isar_service.dart';
import 'package:medicine_notification_app/presentation/add_medicine/add_medicine_view_model.dart';
import 'package:medicine_notification_app/presentation/home/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IsarService.openDB;
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => IsarService()),
        ChangeNotifierProvider(
          create: (context) =>
              AddMedicineViewModel(context.read<IsarService>()),
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF4CAF50), // A shade of green
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFF4CAF50),
          ),
          // Default styling for elevated button for consistency
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              textStyle: const TextStyle(fontSize: 18.0),
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomeView());
  }
}
