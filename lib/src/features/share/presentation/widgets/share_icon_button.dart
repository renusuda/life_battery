import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_progress_state_provider.dart';
import 'package:life_battery/src/features/share/data/share_repository_provider.dart';
import 'package:life_battery/src/features/share/domain/share_message.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

class ShareIconButton extends ConsumerWidget {
  const ShareIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanProgressState = ref
        .watch(lifespanProgressStateProvider)
        .value;
    // Hidden during onboarding because the percentage is meaningless until
    // a birth date has been entered.
    if (lifespanProgressState == null || lifespanProgressState.isInitialUser) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;
    final percentage = lifespanProgressState.lifespanRange
        .remainingLifePercentage(now: DateTime.now());

    return IconButton(
      icon: Icon(
        defaultTargetPlatform == TargetPlatform.iOS
            ? Icons.ios_share
            : Icons.share_outlined,
      ),
      onPressed: () async {
        unawaited(AppHaptics.lightImpact());

        final box = context.findRenderObject()! as RenderBox;
        try {
          await ref
              .read(shareRepositoryProvider)
              .share(
                text: ShareMessage.build(
                  message: l10n.shareMessage(percentage),
                  hashtag: l10n.shareHashtag,
                  platform: defaultTargetPlatform,
                ),
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
              );
        } on Exception {
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.shareErrorContent)),
          );
        }
      },
    );
  }
}
