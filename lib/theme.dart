import 'package:flutter/material.dart';

/// Light mode theme
final lightModeTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF4CAF50),
    secondary: Colors.grey[600]!,
    tertiary: Colors.black,
    error: Colors.red,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
    ),
  ),
);

/// Dark mode theme
final darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF4CAF50),
    secondary: Colors.grey[400]!,
    tertiary: Colors.white,
    error: Colors.red,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[900],
    ),
  ),
);
