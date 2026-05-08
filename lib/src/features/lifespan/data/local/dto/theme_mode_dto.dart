import 'package:flutter/material.dart';

class ThemeModeDto {
  const ThemeModeDto(this.value);
  final String value;

  ThemeMode toDomain() => switch (value) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };
}
