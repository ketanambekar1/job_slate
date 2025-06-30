import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF007AFF);
  static const Color secondary = Color(0xFF4CD964);
  static const Color danger = Color(0xFFFF3B30);

  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF121212);

  static const Color textLight = Color(0xFF000000);
  static const Color textDark = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: lightBackground,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: textLight),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: textDark),
    ),
  );
}
