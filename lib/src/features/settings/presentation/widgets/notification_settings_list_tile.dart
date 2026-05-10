import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class NotificationSettingsListTile extends StatelessWidget {
  const NotificationSettingsListTile({
    required this.onOpenSettings,
    super.key,
  });

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.notifications_outlined),
      title: Text(
        l10n.notificationSettingsLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onOpenSettings,
    );
  }
}
