import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/ideal_age_preset_button.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/ideal_age_stepper_button.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/age_utils.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

const _maxAge = 150;
const _presetAges = [70, 80, 90, 100];

class IdealAgeStepperField extends StatelessWidget {
  const IdealAgeStepperField({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
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
        IdealAgeStepper(birthDate: birthDate, idealAge: idealAge),
      ],
    );
  }
}

class IdealAgeStepper extends ConsumerWidget {
  const IdealAgeStepper({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minAge = currentAge(birthDate: birthDate, now: DateTime.now()) + 1;
    final safeIdealAge = idealAge.clamp(minAge, _maxAge);

    // Reads the latest value because a held button's timer keeps calling
    // the closure captured when the hold started.
    int currentIdealAge() =>
        ref.read(lifespanRangeManagerProvider).value?.idealAge ?? idealAge;

    Future<void> update(int next) async {
      if (next == currentIdealAge()) return;
      unawaited(AppHaptics.selectionClick());
      await ref
          .read(lifespanRangeManagerProvider.notifier)
          .updateLifespanRange(birthDate: birthDate, idealAge: next);
    }

    Future<void> step(int delta) =>
        update((currentIdealAge() + delta).clamp(minAge, _maxAge));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IdealAgeStepperButton(
              key: const Key('idealAgeDecrement'),
              icon: Icons.remove,
              enabled: safeIdealAge > minAge,
              onPressed: () => step(-1),
            ),
            IdealAgeValue(idealAge: safeIdealAge),
            IdealAgeStepperButton(
              key: const Key('idealAgeIncrement'),
              icon: Icons.add,
              enabled: safeIdealAge < _maxAge,
              onPressed: () => step(1),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          spacing: 8,
          children: [
            for (final age in _presetAges)
              Expanded(
                child: IdealAgePresetButton(
                  key: Key('idealAgePreset$age'),
                  age: age,
                  enabled: age >= minAge,
                  onPressed: () => update(age),
                ),
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
