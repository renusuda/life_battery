import 'package:flutter/material.dart';

/// Light mode theme
final lightModeTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: Colors.white,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF10B981),
    secondary: Colors.grey[600]!,
    tertiary: Colors.black,
    error: Colors.red,
    surfaceContainerHighest: const Color(0xFFF8FAFC),
    outlineVariant: const Color(0xFFE2E8F0),
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
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFF161E33),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Color(0xFF161E33),
  ),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF10B981),
    secondary: Colors.grey[400]!,
    tertiary: Colors.white,
    error: Colors.red,
    surfaceContainerHighest: const Color(0xFF161E33),
    outlineVariant: const Color(0xFF1E293B),
  ),
);
