import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/screens/settings_screen.dart';

void main() {
  group('Localization tests', () {
    testWidgets('Device locale is English when set to English', (tester) async {
      await tester.pumpWidget(
        const LocalizedSettingsScreen(locale: Locale('en')),
      );
      expect(find.text('App tutorial'), findsOneWidget);
    });
  });
}

class LocalizedSettingsScreen extends StatelessWidget {
  const LocalizedSettingsScreen({required this.locale, super.key});

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Localizations(
          delegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,
          child: const SettingsScreen(),
        ),
      ),
    );
  }
}
