import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/home_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/app_theme_mode_provider.dart';
import 'package:life_battery/src/common_widgets/common_material_app.dart';

/// Application
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(appThemeModeProvider);

    return switch (appThemeMode) {
      AsyncData(:final value) => CommonMaterialApp(
        themeMode: value,
        home: const HomePage(),
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
