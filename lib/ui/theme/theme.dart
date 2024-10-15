import 'package:flutter/material.dart';

const primaryColor = Color(0xFF8687E7);
final themeData = ThemeData();

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    surface: Color(0xFF363636),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF121212),
  ),
  cardColor: Color(0xFF363636),
);

final textTheme = TextTheme(
  labelMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  ),
);
