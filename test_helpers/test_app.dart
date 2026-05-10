import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/theme/app_theme.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    required this.home,
    this.themeMode = ThemeMode.system,
    super.key,
  });

  final Widget home;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,
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
        Locale('ja'),
        Locale('en'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        const defaultLocale = Locale('en');
        return supportedLocales.firstWhereOrNull(
              (supportedLocale) =>
                  supportedLocale.languageCode == locale?.languageCode,
            ) ??
            defaultLocale;
      },
    );
  }
}
