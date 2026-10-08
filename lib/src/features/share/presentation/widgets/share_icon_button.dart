import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_progress_state_provider.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';
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
    final now = DateTime.now();
    final percentage = lifespanProgressState.lifespanRange
        .remainingLifePercentage(now: now);
    final days = lifespanProgressState.lifespanRange.remainingLifeDays(
      now: now,
    );
    final text = lifespanProgressState.isPercentageMode
        ? '$percentage%'
        : '${days.withCommaString}${l10n.dayUnit}';

    return IconButton(
      icon: Icon(
        defaultTargetPlatform == TargetPlatform.iOS
            ? Icons.ios_share
            : Icons.share_outlined,
      ),
      onPressed: () async {
        unawaited(AppHaptics.lightImpact());

        await ShareCardDialog.show(
          context,
          percentage: percentage,
          text: text,
        );
      },
    );
  }
}
