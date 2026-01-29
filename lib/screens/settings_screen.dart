import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/providers/app_theme_mode.dart';
import 'package:life_battery/providers/local_database.dart';
import 'package:life_battery/screens/user_deleted_screen.dart';
import 'package:life_battery/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

/// A screen that shows the settings.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const <Widget>[
          ReviewAppListTile(),
          PrivacyPolicyListTile(
            canLaunchUrl: canLaunchUrl,
            onLaunchUrl: launchUrl,
          ),
          AppearanceListTile(),
          DeleteAllListTile(),
        ],
      ),
    );
  }
}

/// Review app row
class ReviewAppListTile extends StatelessWidget {
  const ReviewAppListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.favorite_outline),
      title: Text(
        l10n.reviewAppLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () async {
        final inAppReview = InAppReview.instance;
        if (Platform.isIOS) {
          await inAppReview.openStoreListing(appStoreId: '6449723058');
        } else if (Platform.isAndroid) {
          await inAppReview.openStoreListing();
        }
      },
    );
  }
}

/// Privacy policy row
class PrivacyPolicyListTile extends StatelessWidget {
  const PrivacyPolicyListTile({
    required this.canLaunchUrl,
    required this.onLaunchUrl,
    super.key,
  });

  /// Callback for checking if URL can be launched.
  final Future<bool> Function(Uri url) canLaunchUrl;

  /// Callback for launching URL.
  final Future<bool> Function(Uri url, {LaunchMode mode}) onLaunchUrl;

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
        final langPath = isJapanese ? 'ja' : 'en';

        final url = Uri.parse(
          'https://renusuda.github.io/life_battery_privacy_policy/$langPath',
        );
        if (await canLaunchUrl(url)) {
          await onLaunchUrl(
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
        onSelected: (ThemeMode mode) async {
          await ref.read(appThemeModeProvider.notifier).updateThemeMode(mode);
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
      AsyncError() => Center(
        child: Text(l10n.generalError),
      ),
      _ => const Center(
        child: CircularProgressIndicator(),
      ),
    };
  }
}

/// Data deletion row
class DeleteAllListTile extends ConsumerWidget {
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
      onTap: () async {
        await showDialog<void>(
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
                onPressed: () async {
                  Navigator.pop(context);
                  // Delete all data from database
                  ref.read(deleteAllDataProvider);
                  // Navigate to user deleted screen
                  Navigator.pop(context);
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const UserDeletedScreen(),
                    ),
                  );
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
