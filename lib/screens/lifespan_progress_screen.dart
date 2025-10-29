import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/providers/is_initial_user.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/settings_screen.dart';
import 'package:life_battery/utils/extensions.dart';
import 'package:life_battery/widgets/battery_indicator.dart';
import 'package:life_battery/widgets/date_input_bottom_sheet.dart';

/// Screen for showing the remaining of lifespan
class LifespanProgressScreen extends ConsumerWidget {
  /// Constructor
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
  /// Constructor
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

  void _toggleMode() {
    setState(() {
      _isPercentageMode = !_isPercentageMode;
    });
  }

  void _showDateInputBottomSheet() {
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return const DateInputBottomSheet();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Show the date input bottom sheet if the user is initial user
    if (widget.isInitialUser) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDateInputBottomSheet();
      });
    }
    // Update the user is not initial user
    unawaited(widget.updateUserIsNotInitialUser());
  }

  @override
  Widget build(BuildContext context) {
    final remainingLifePercentage =
        widget.lifespanRange.remainingLifePercentage(
      now: DateTime.now(),
    );
    final remainingLifeDays = widget.lifespanRange.remainingLifeDays(
      now: DateTime.now(),
    );

    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onLongPress: _showDateInputBottomSheet,
      onTap: _toggleMode,
      child: BatteryIndicator(
        value: remainingLifePercentage,
        text: _isPercentageMode
            ? '$remainingLifePercentage%'
            : '${remainingLifeDays.withCommaString}${l10n.dayUnit}',
      ),
    );
  }
}
