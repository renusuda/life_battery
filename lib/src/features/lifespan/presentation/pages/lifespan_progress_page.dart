import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/data/local_notification_service.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/settings_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/display_mode_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/has_long_pressed_battery_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_input_bottom_sheet.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/long_press_hint.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class LifespanProgressPage extends ConsumerWidget {
  const LifespanProgressPage({
    required this.isInitialUser,
    super.key,
  });

  final bool isInitialUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);
    final hasLongPressedBattery = ref.watch(hasLongPressedBatteryProvider);
    final displayMode = ref.watch(displayModeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: switch (lifespanRangeManager) {
          AsyncData(value: final lifespanRange) =>
            switch (hasLongPressedBattery) {
              AsyncData(value: final hasLongPressedBatteryValue) =>
                switch (displayMode) {
                  AsyncData(value: final isPercentageMode) =>
                    LifeProgressContent(
                      lifespanRange: lifespanRange,
                      isInitialUser: isInitialUser,
                      hasLongPressedBattery: hasLongPressedBatteryValue,
                      isPercentageMode: isPercentageMode,
                      updateUserIsNotInitialUser: () async {
                        await ref
                            .read(isInitialUserProvider.notifier)
                            .updateUserIsNotInitialUser();
                      },
                      updateHasLongPressedBattery: () async {
                        await ref
                            .read(hasLongPressedBatteryProvider.notifier)
                            .updateHasLongPressedBattery();
                      },
                    ),
                  AsyncError() => Text(l10n.generalError),
                  _ => const CircularProgressIndicator(),
                },
              AsyncError() => Text(l10n.generalError),
              _ => const CircularProgressIndicator(),
            },
          AsyncError() => Text(l10n.generalError),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}

class LifeProgressContent extends StatefulHookConsumerWidget {
  const LifeProgressContent({
    required this.lifespanRange,
    required this.isInitialUser,
    required this.hasLongPressedBattery,
    required this.isPercentageMode,
    required this.updateUserIsNotInitialUser,
    required this.updateHasLongPressedBattery,
    super.key,
  });

  final LifespanRange lifespanRange;

  final bool isInitialUser;

  final bool hasLongPressedBattery;

  final bool isPercentageMode;

  final Future<void> Function() updateUserIsNotInitialUser;

  final Future<void> Function() updateHasLongPressedBattery;

  @override
  ConsumerState<LifeProgressContent> createState() =>
      _LifeProgressContentState();
}

class _LifeProgressContentState extends ConsumerState<LifeProgressContent> {
  var _isNotificationScheduled = false;
  Timer? _notificationTimer;

  Future<void> _showDateInputBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const DateInputBottomSheet();
      },
    );
  }

  Future<void> _handleLongPress() async {
    if (!widget.hasLongPressedBattery) {
      await widget.updateHasLongPressedBattery();
    }
    if (!mounted) return;
    await _showDateInputBottomSheet();
  }

  Future<void> _scheduleNotification() async {
    if (!mounted) return;
    final now = DateTime.now();
    final dropDate = widget.lifespanRange.nextDropDate(now: now);
    if (dropDate == null) return;

    final l10n = AppLocalizations.of(context)!;
    final percentage =
        widget.lifespanRange.remainingLifePercentage(now: now) - 1;
    // Schedule at 9:00 AM on the drop date.
    final scheduledDate = DateTime(
      dropDate.year,
      dropDate.month,
      dropDate.day,
      9,
    );
    await LocalNotificationService.scheduleNotification(
      title: l10n.notificationTitle(percentage),
      body: percentage == 0
          ? l10n.notificationBodyZeroPercent
          : l10n.notificationBody,
      scheduledDate: scheduledDate,
    );
    _isNotificationScheduled = true;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isInitialUser) {
        await _showDateInputBottomSheet();
        if (!mounted) return;
      }
      _notificationTimer = Timer(
        const Duration(seconds: 3),
        () => unawaited(_scheduleNotification()),
      );
    });
    unawaited(widget.updateUserIsNotInitialUser());
  }

  @override
  void dispose() {
    _notificationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    useEffect(() {
      if (!_isNotificationScheduled) return null;
      final timer = Timer(
        const Duration(seconds: 1),
        () => unawaited(_scheduleNotification()),
      );
      return timer.cancel;
    }, [widget.lifespanRange]);

    final remainingLifePercentage = widget.lifespanRange
        .remainingLifePercentage(
          now: DateTime.now(),
        );
    final remainingLifeDays = widget.lifespanRange.remainingLifeDays(
      now: DateTime.now(),
    );

    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onLongPress: _handleLongPress,
      onTap: () => ref.read(displayModeManagerProvider.notifier).toggle(),
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
              text: widget.isPercentageMode
                  ? '$remainingLifePercentage%'
                  : '${remainingLifeDays.withCommaString}${l10n.dayUnit}',
            ),
          ),
          const SizedBox(height: 32),
          LongPressHint(
            hasLongPressedBattery: widget.hasLongPressedBattery,
          ),
        ],
      ),
    );
  }
}
