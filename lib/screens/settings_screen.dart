import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/app_theme_mode.dart';
import 'package:life_battery/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

/// A screen that shows the settings.
class SettingsScreen extends StatelessWidget {
  /// Constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const <Widget>[
          // TODO(me): Complete how to use the app
          TutorialListTile(),
          PrivacyPolicyListTile(),
          // TODO(me): Complete the display mode
          AppearanceListTile(),
          // TODO(me): Complete the data deletion
          DeleteAllListTile(),
        ],
      ),
    );
  }
}

/// Tutorial row
class TutorialListTile extends StatelessWidget {
  /// Constructor
  const TutorialListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: const Text(
        'アプリの使い方',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}

/// Privacy policy row
class PrivacyPolicyListTile extends StatelessWidget {
  /// Constructor
  const PrivacyPolicyListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.lock_outline),
      title: Text(
        l10n.privacyPolicyLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () async {
        final url = Uri.parse(
          'https://ru2lu.github.io/life-battery-privacy-policy-site/',
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            // Launch the web page in the app itself
            mode: LaunchMode.inAppBrowserView,
          );
        }
      },
    );
  }
}

/// Appearance row
class AppearanceListTile extends ConsumerWidget {
  /// Constructor
  const AppearanceListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(appThemeModeProvider);
    final l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<ThemeMode>(
      initialValue: selectedMode,
      position: PopupMenuPosition.over,
      offset: const Offset(100, 0),
      onSelected: (ThemeMode mode) {
        ref.read(appThemeModeProvider.notifier).updateThemeMode(mode);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: Text(
            l10n.systemLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Text(
            l10n.lightLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Text(
            l10n.darkLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      child: ListTile(
        leading: const Icon(Icons.wb_sunny_outlined),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.appearanceLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              selectedMode.label(l10n),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.unfold_more),
      ),
    );
  }
}

/// Data deletion row
class DeleteAllListTile extends StatelessWidget {
  /// Constructor
  const DeleteAllListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.delete_outlined),
      title: Text(
        'データを削除',
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}
