// lib/main.dart
import 'package:flutter/material.dart';
import 'package:dynasty_academy/utils/theme.dart';
import 'package:dynasty_academy/screens/splash_screen.dart';

void main() {
  runApp(const DynastyAcademyApp());
}

class DynastyAcademyApp extends StatelessWidget {
  const DynastyAcademyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynasty Academy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const SplashScreen(),
    );
  }
}
