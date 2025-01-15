import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/app_theme_mode.dart';
import 'package:life_battery/repositories/local_database.dart';
import 'package:life_battery/screens/home_screen.dart';
import 'package:life_battery/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  /// Constructor
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Life Battery',
      theme: lightModeTheme,
      darkTheme: darkModeTheme,
      themeMode: ref.watch(appThemeModeProvider),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'), // Japanese
        Locale('en'), // English
      ],
      home: const HomeScreen(),
    );
  }
}
