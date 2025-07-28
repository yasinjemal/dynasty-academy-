// lib/utils/theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFD700);
  static const Color darkBg  = Color(0xFF171717);
  static const Color surface = Color(0xFF1E1E1E);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: primary),
      titleTextStyle: TextStyle(
        color: primary, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    // REMOVE custom cardTheme to match your Flutter version
    // Elevated buttons, etc. stay the same:
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: primary,
    scaffoldBackgroundColor: darkBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBg,
      elevation: 0,
      iconTheme: IconThemeData(color: primary),
      titleTextStyle: TextStyle(
        color: primary, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primary,
      onPrimary: Colors.black,
      surface: surface,
      onSurface: Colors.white70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
