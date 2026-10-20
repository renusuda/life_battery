import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/ideal_age_stepper_button.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/age_utils.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

const _maxAge = 150;

class IdealAgeStepperField extends ConsumerWidget {
  const IdealAgeStepperField({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final minAge = currentAge(birthDate: birthDate, now: DateTime.now()) + 1;
    final safeIdealAge = idealAge.clamp(minAge, _maxAge);

    Future<void> update(int newIdealAge) async {
      if (newIdealAge == safeIdealAge) return;
      unawaited(AppHaptics.selectionClick());
      await ref
          .read(lifespanRangeManagerProvider.notifier)
          .updateLifespanRange(birthDate: birthDate, idealAge: newIdealAge);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            l10n.idealLifespanLabel,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IdealAgeStepperButton(
              key: const Key('idealAgeDecrement'),
              icon: Icons.remove,
              enabled: safeIdealAge > minAge,
              onPressed: () => update(safeIdealAge - 1),
            ),
            IdealAgeValue(idealAge: safeIdealAge),
            IdealAgeStepperButton(
              key: const Key('idealAgeIncrement'),
              icon: Icons.add,
              enabled: safeIdealAge < _maxAge,
              onPressed: () => update(safeIdealAge + 1),
            ),
          ],
        ),
      ],
    );
  }
}

class IdealAgeValue extends StatelessWidget {
  const IdealAgeValue({required this.idealAge, super.key});

  final int idealAge;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          key: const Key('idealAgeText'),
          '$idealAge',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        Text(
          l10n.ageUnit,
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
