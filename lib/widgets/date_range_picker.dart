import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/date_utils.dart';

/// A widget that allows users to select a date range.
class DateRangePicker extends ConsumerWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return switch (lifespanRangeManager) {
      AsyncData(:final value) => DateRangePickerContent(
        birthDate: value.birthDate,
        deathDate: value.deathDate,
      ),
      AsyncError() => Text(l10n.generalError),
      _ => const CircularProgressIndicator(),
    };
  }
}

/// A content of the date range picker.
class DateRangePickerContent extends StatelessWidget {
  const DateRangePickerContent({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Death date
  final DateTime deathDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateRangePickerLabels(
          birthDate: birthDate,
          deathDate: deathDate,
        ),
      ],
    );
  }
}

/// A widget that displays the labels of the date range picker.
class DateRangePickerLabels extends StatelessWidget {
  const DateRangePickerLabels({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Death date
  final DateTime deathDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          BirthDateField(
            birthDate: birthDate,
            deathDate: deathDate,
          ),
          const SizedBox(height: 20),
          IdealLifespanField(
            birthDate: birthDate,
            deathDate: deathDate,
          ),
        ],
      ),
    );
  }
}

/// A birth date field with label.
class BirthDateField extends ConsumerWidget {
  const BirthDateField({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Death date
  final DateTime deathDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            l10n.birthDateLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            await showPickerForBirthDate(
              context: context,
              ref: ref,
              birthDate: birthDate,
              deathDate: deathDate,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              border: Border.all(
                color: theme.colorScheme.outlineVariant,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(context, birthDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// An ideal lifespan field with label and slider.
class IdealLifespanField extends ConsumerWidget {
  const IdealLifespanField({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Death date
  final DateTime deathDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final idealAge = deathDate.year - birthDate.year;
    // Ensure minimum age is current age + 1
    // to prevent remaining lifespan from reaching 0%
    final minAge = _getCurrentAge() + 1;
    // Clamp idealAge to minAge to avoid Slider value < min error
    final safeIdealAge = idealAge < minAge ? minAge : idealAge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            l10n.idealLifespanLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        IdealAgeLabel(idealAge: safeIdealAge),
        Slider(
          value: safeIdealAge.toDouble(),
          min: minAge.toDouble(),
          max: 500,
          onChanged: (value) {
            final newDeathDate = DateTime(
              birthDate.year + value.toInt(),
              birthDate.month,
              birthDate.day,
            );
            unawaited(
              ref
                  .read(lifespanRangeManagerProvider.notifier)
                  .updateLifespanRange(
                    birthDate: birthDate,
                    deathDate: newDeathDate,
                  ),
            );
          },
        ),
      ],
    );
  }

  int _getCurrentAge() {
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    final thisYearBirthday = DateTime(now.year, birthDate.month, birthDate.day);
    if (now.isBefore(thisYearBirthday)) {
      age--;
    }
    return age;
  }
}

/// A widget that displays the ideal age with unit.
class IdealAgeLabel extends StatelessWidget {
  const IdealAgeLabel({
    required this.idealAge,
    super.key,
  });

  /// The ideal age to display
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
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
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
