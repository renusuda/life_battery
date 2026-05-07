import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/src/providers/app_theme_mode.dart';
import 'package:life_battery/src/screens/home_screen.dart';
import 'package:life_battery/src/widgets/common_material_app.dart';

/// Application
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(appThemeModeProvider);

    return switch (appThemeMode) {
      AsyncData(:final value) => CommonMaterialApp(
        themeMode: value,
        home: const HomeScreen(),
      ),
      AsyncError() => CommonMaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text(''),
          ),
        ),
      ),
      _ => CommonMaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    };
  }
}
