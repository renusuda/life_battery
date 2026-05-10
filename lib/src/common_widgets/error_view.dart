import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Text(l10n.generalError),
    );
  }
}
