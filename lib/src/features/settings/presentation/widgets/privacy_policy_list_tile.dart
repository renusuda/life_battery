import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyListTile extends StatelessWidget {
  const PrivacyPolicyListTile({
    required this.canLaunchUrl,
    required this.onLaunchUrl,
    super.key,
  });

  final Future<bool> Function(Uri url) canLaunchUrl;

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
            mode: LaunchMode.inAppBrowserView,
          );
        }
      },
    );
  }
}
