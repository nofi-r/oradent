
import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Oradent Logo
              Image.asset(
                'assets/images/oradent_logo.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.health_and_safety_outlined,
                    size: 150,
                    color: Color(0xFF0F3E75),
                  );
                },
              ),

              const SizedBox(height: 20),

              // App Name
              const Text(
                'ORADENT',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F3E75),
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              // Tagline
              const Text(
                'Smart Dental Care',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0F3E75),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
