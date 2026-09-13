import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// Links to the Terms of Use (EULA).
///
/// App Review Guideline 3.1.2 requires the link to be reachable from
/// the paywall because the app sells an auto-renewable subscription.
class PremiumLegalLinks extends StatelessWidget {
  const PremiumLegalLinks({
    required this.canLaunchUrl,
    required this.onLaunchUrl,
    super.key,
  });

  final Future<bool> Function(Uri url) canLaunchUrl;

  final Future<bool> Function(Uri url, {LaunchMode mode}) onLaunchUrl;

  /// The standard Apple Terms of Use (EULA).
  static final Uri _termsOfUseUrl = Uri.parse(
    'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
  );

  Future<void> _open(Uri url) async {
    if (await canLaunchUrl(url)) {
      await onLaunchUrl(url, mode: LaunchMode.inAppBrowserView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final linkStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      decoration: TextDecoration.underline,
    );
    final compactButtonStyle = TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: compactButtonStyle,
          onPressed: () async => _open(_termsOfUseUrl),
          child: Text(l10n.termsOfUseLabel, style: linkStyle),
        ),
      ],
    );
  }
}
