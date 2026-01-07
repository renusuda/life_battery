import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/firebase_options.dart';
import 'package:life_battery/providers/app_theme_mode.dart';
import 'package:life_battery/repositories/local_database.dart';
import 'package:life_battery/screens/home_screen.dart';
import 'package:life_battery/widgets/common_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the database
  await LocalDatabase().database;

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

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
