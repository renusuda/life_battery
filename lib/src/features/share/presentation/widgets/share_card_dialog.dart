import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_message.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/repaint_boundary_image.dart';

class ShareCardDialog extends HookConsumerWidget {
  const ShareCardDialog({
    required this.percentage,
    required this.text,
    super.key,
  });

  static Future<void> show(
    BuildContext context, {
    required int percentage,
    required String text,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => ShareCardDialog(percentage: percentage, text: text),
    );
  }

  final int percentage;

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cardKey = useMemoized(GlobalKey.new);

    Future<void> share() async {
      try {
        final imageBytes = await captureRepaintBoundaryPng(cardKey);
        final box = cardKey.currentContext!.findRenderObject()! as RenderBox;
        await ref
            .read(shareRepositoryProvider)
            .share(
              text: ShareMessage.build(
                message: l10n.shareMessage(percentage),
                hashtag: l10n.shareHashtag,
                platform: defaultTargetPlatform,
              ),
              imageBytes: imageBytes,
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
            );
      } on Exception {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.shareErrorContent)),
        );
      }
      if (!context.mounted) return;
      await Navigator.of(context).maybePop();
    }

    useEffect(() {
      unawaited(share());
      return null;
    }, const []);

    // Top-aligned so the share sheet does not cover the card.
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.topCenter,
      insetPadding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 72,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: RepaintBoundary(
        key: cardKey,
        child: ShareCard(value: percentage, text: text),
      ),
    );
  }
}
