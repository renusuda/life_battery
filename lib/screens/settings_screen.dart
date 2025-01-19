import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/app_theme_mode.dart';
import 'package:life_battery/providers/local_database.dart';
import 'package:life_battery/screens/tutorial_screen.dart';
import 'package:life_battery/utils/extensions.dart';
import 'package:life_battery/widgets/restart_widget.dart';
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
          TutorialListTile(),
          PrivacyPolicyListTile(),
          AppearanceListTile(),
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
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(
        l10n.tutorialLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => TutorialScreen(
              onDone: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
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
        final locale = Localizations.localeOf(context);
        final isJapanese = locale.languageCode == 'ja';
        final queryParameter = isJapanese ? '' : '?lang=en';

        final url = Uri.parse(
          'https://ru2lu.github.io/life_battery_privacy_policy/$queryParameter',
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
    final appThemeMode = ref.watch(appThemeModeProvider);
    final l10n = AppLocalizations.of(context)!;

    return switch (appThemeMode) {
      AsyncData(:final value) => PopupMenuButton<ThemeMode>(
          initialValue: value,
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
                  value.label(l10n),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.unfold_more),
          ),
        ),
      AsyncError() => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(l10n.generalError),
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    };
  }
}

/// Data deletion row
class DeleteAllListTile extends ConsumerWidget {
  /// Constructor
  const DeleteAllListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.delete_outlined),
      title: Text(
        l10n.deleteAllLabel,
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              l10n.deleteTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: Text(l10n.deleteContent),
            actions: <Widget>[
              /// Cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  l10n.cancelLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),

              /// Delete button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Delete all data from the database
                  ref.read(clearDatabaseProvider);
                  // Restart the app
                  RestartWidget.restartApp(context);
                },
                child: Text(
                  l10n.deleteLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
