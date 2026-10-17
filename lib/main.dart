
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

const Color iceBlue = Color(0xFFB3D2D8);
const Color navyBlue = Color(0xFF0F3E75);

void main() {
  runApp(const OradentApp());
}

class OradentApp extends StatelessWidget {
  const OradentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oradent',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navyBlue,
          primary: navyBlue,
          secondary: iceBlue,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: navyBlue,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: navyBlue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
