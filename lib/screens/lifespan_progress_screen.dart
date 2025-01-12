import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/models/lifespan_range.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/date_input_screen.dart';
import 'package:life_battery/widgets/battery_indicator.dart';

/// Screen for showing the remaining of lifespan
class LifespanProgressScreen extends ConsumerWidget {
  /// Constructor
  const LifespanProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: switch (lifespanRangeManager) {
          AsyncData(:final value) => LifeProgressContent(lifespanRange: value),
          AsyncError() => Text(l10n.generalError),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}

/// Content of the battery indicator
class LifeProgressContent extends StatelessWidget {
  /// Constructor
  const LifeProgressContent({
    required this.lifespanRange,
    super.key,
  });

  /// the range of a person's lifespan.
  final LifespanRange lifespanRange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const DateInputScreen(),
          ),
        );
      },
      child: BatteryIndicator(value: lifespanRange.remainingLifePercentage),
    );
  }
}
