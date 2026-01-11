import 'package:flutter/material.dart';

/// Light mode theme
final lightModeTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF1F5F9),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF1F5F9),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFFF1F5F9),
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF4CAF50),
    secondary: Colors.grey[600]!,
    tertiary: Colors.black,
    error: Colors.red,
  ),
);

/// Dark mode theme
final darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F172A),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F172A),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF0F172A),
  ),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF4CAF50),
    secondary: Colors.grey[400]!,
    tertiary: Colors.white,
    error: Colors.red,
  ),
);
