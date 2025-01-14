import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// A screen that shows the settings.
class SettingsScreen extends StatelessWidget {
  /// Constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          // TODO(me): Complete how to use the app
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(
              'アプリの使い方',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
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
          ),
          // TODO(me): Complete the display mode
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '表示モード',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'システム',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.unfold_more),
            onTap: () {},
          ),
          // TODO(me): Complete the data deletion
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: const Text(
              'データを削除',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
