import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: const Color(0xFF007AFF),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007AFF)),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: const Color(0xFF0A84FF),
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A84FF), brightness: Brightness.dark),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}
