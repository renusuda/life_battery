import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_battery/theme.dart';

/// Common Material App
class CommonMaterialApp extends StatelessWidget {
  /// Constructor
  const CommonMaterialApp({
    required this.home,
    this.themeMode = ThemeMode.system,
    super.key,
  });

  /// Home
  final Widget home;

  /// Theme mode
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Battery',
      theme: lightModeTheme,
      darkTheme: darkModeTheme,
      themeMode: themeMode,
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
      home: home,
    );
  }
}
