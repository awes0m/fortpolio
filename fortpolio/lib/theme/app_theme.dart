import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0E0F12),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF7A18),
        secondary: Color(0xFF00C2FF),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0E0F12),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontWeight: FontWeight.w600),
      ),
      useMaterial3: true,
    );
  }
}
