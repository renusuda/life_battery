import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// User deleted screen
class UserDeletedPage extends StatelessWidget {
  const UserDeletedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          l10n.userDeletionSuccess,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
