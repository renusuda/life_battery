import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/async_value_widget.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/ads/presentation/widgets/banner_ad_widget.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/review_request_provider.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/display_mode_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/has_long_pressed_battery_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_progress_state_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_input_bottom_sheet.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/long_press_hint.dart';
import 'package:life_battery/src/features/notifications/presentation/providers/notification_schedule_provider.dart';
import 'package:life_battery/src/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_icon_button.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/routing/app_route.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

class LifespanProgressPage extends ConsumerWidget {
  const LifespanProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanProgressState = ref.watch(lifespanProgressStateProvider);

    // Draws nothing until the initial-user flag is known, so first-time users
    // never glimpse the home page before onboarding.
    if (!lifespanProgressState.hasValue && !lifespanProgressState.hasError) {
      return const Scaffold();
    }
    if (lifespanProgressState.value?.isInitialUser ?? false) {
      return const OnboardingPage();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      // Keep the battery centered on the full screen even when the banner
      // ad is visible
      extendBody: true,
      appBar: AppBar(
        actions: [
          const ShareIconButton(),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.goNamed(AppRoute.settings.name),
          ),
        ],
      ),
      bottomNavigationBar: const BannerAdWidget(),
      body: AsyncValueWidget(
        asyncValue: lifespanProgressState,
        data: (state) => Center(
          child: LifeProgressContent(
            lifespanRange: state.lifespanRange,
            hasLongPressedBattery: state.hasLongPressedBattery,
            isPercentageMode: state.isPercentageMode,
            updateHasLongPressedBattery: () async {
              await ref
                  .read(hasLongPressedBatteryProvider.notifier)
                  .updateHasLongPressedBattery();
            },
          ),
        ),
      ),
    );
  }
}

class LifeProgressContent extends HookConsumerWidget {
  const LifeProgressContent({
    required this.lifespanRange,
    required this.hasLongPressedBattery,
    required this.isPercentageMode,
    required this.updateHasLongPressedBattery,
    super.key,
  });

  final LifespanRange lifespanRange;

  final bool hasLongPressedBattery;

  final bool isPercentageMode;

  final Future<void> Function() updateHasLongPressedBattery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);
    final isNotificationScheduled = useRef(false);
    final hasRequestedReview = useRef(false);

    Future<void> showDateInputBottomSheet() {
      return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return const DateInputBottomSheet();
        },
      );
    }

    Future<void> scheduleNotification() async {
      if (!context.mounted) return;
      final now = DateTime.now();
      final l10n = AppLocalizations.of(context)!;
      final percentage = lifespanRange.remainingLifePercentage(now: now) - 1;
      await ref
          .read(notificationScheduleProvider.notifier)
          .schedule(
            title: l10n.notificationTitle(percentage),
            body: percentage == 0
                ? l10n.notificationBodyZeroPercent
                : l10n.notificationBody,
            lifespanRange: lifespanRange,
          );
      isNotificationScheduled.value = true;
    }

    Future<void> handleLongPress() async {
      unawaited(AppHaptics.mediumImpact());
      if (!hasLongPressedBattery) {
        await updateHasLongPressedBattery();
      }
      if (!context.mounted) return;
      await showDateInputBottomSheet();
    }

    useEffect(() {
      Timer? timer;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        timer = Timer(
          const Duration(seconds: 3),
          () => unawaited(scheduleNotification()),
        );
      });
      return () => timer?.cancel();
    }, const []);

    useEffect(() {
      if (!isNotificationScheduled.value) return null;
      final timer = Timer(
        const Duration(seconds: 1),
        () => unawaited(scheduleNotification()),
      );
      return timer.cancel;
    }, [lifespanRange]);

    final remainingLifePercentage = lifespanRange.remainingLifePercentage(
      now: DateTime.now(),
    );
    final remainingLifeDays = lifespanRange.remainingLifeDays(
      now: DateTime.now(),
    );

    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onLongPress: handleLongPress,
      onTap: () {
        unawaited(AppHaptics.selectionClick());
        ref.read(displayModeManagerProvider.notifier).toggle();
        if (!hasRequestedReview.value) {
          hasRequestedReview.value = true;
          unawaited(
            ref.read(reviewRequestProvider.notifier).requestIfHeavyUser(),
          );
        }
      },
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedScale(
            scale: isPressed.value ? 0.90 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: BatteryIndicator(
              value: remainingLifePercentage,
              text: isPercentageMode
                  ? '$remainingLifePercentage%'
                  : '${remainingLifeDays.withCommaString}${l10n.dayUnit}',
            ),
          ),
          const SizedBox(height: 32),
          LongPressHint(
            hasLongPressedBattery: hasLongPressedBattery,
          ),
        ],
      ),
    );
  }
}
