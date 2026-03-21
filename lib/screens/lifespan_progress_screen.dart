import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/providers/is_initial_user.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/settings_screen.dart';
import 'package:life_battery/services/local_notification_service.dart';
import 'package:life_battery/utils/extensions.dart';
import 'package:life_battery/widgets/battery_indicator.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

/// Screen for showing the remaining of lifespan
class LifespanProgressScreen extends ConsumerWidget {
  const LifespanProgressScreen({
    required this.isInitialUser,
    super.key,
  });

  /// Whether the user is initial user
  final bool isInitialUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

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
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: switch (lifespanRangeManager) {
          AsyncData(:final value) => LifeProgressContent(
            lifespanRange: value,
            isInitialUser: isInitialUser,
            updateUserIsNotInitialUser: () async {
              await ref
                  .read(isInitialUserProvider.notifier)
                  .updateUserIsNotInitialUser();
            },
          ),
          AsyncError() => Text(l10n.generalError),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}

/// Content of the battery indicator
class LifeProgressContent extends StatefulWidget {
  const LifeProgressContent({
    required this.lifespanRange,
    required this.isInitialUser,
    required this.updateUserIsNotInitialUser,
    super.key,
  });

  /// the range of a person's lifespan.
  final LifespanRange lifespanRange;

  /// Whether the user is initial user
  final bool isInitialUser;

  /// Callback to update the user is not initial user
  final Future<void> Function() updateUserIsNotInitialUser;

  @override
  State<LifeProgressContent> createState() => _LifeProgressContentState();
}

class _LifeProgressContentState extends State<LifeProgressContent> {
  var _isPercentageMode = true;
  var _isPressed = false;
  var _isNotificationScheduled = false;
  Timer? _notificationTimer;
  Timer? _debounceTimer;

  void _toggleMode() {
    setState(() {
      _isPercentageMode = !_isPercentageMode;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  Future<void> _showDateInputBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const DateInputBottomSheet();
      },
    );
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
  void didUpdateWidget(covariant LifeProgressContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isNotificationScheduled) return;
    if (widget.lifespanRange != oldWidget.lifespanRange) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(
        const Duration(seconds: 1),
        () => unawaited(_scheduleNotification()),
      );
    }
  }

  @override
  void dispose() {
    _notificationTimer?.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remainingLifePercentage = widget.lifespanRange
        .remainingLifePercentage(
          now: DateTime.now(),
        );
    final remainingLifeDays = widget.lifespanRange.remainingLifeDays(
      now: DateTime.now(),
    );

    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onLongPress: _showDateInputBottomSheet,
      onTap: _toggleMode,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedScale(
            scale: _isPressed ? 0.90 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: BatteryIndicator(
              value: remainingLifePercentage,
              text: _isPercentageMode
                  ? '$remainingLifePercentage%'
                  : '${remainingLifeDays.withCommaString}${l10n.dayUnit}',
            ),
          ),
          const SizedBox(height: 32),
          Text(
            l10n.longPressToEditHint,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
