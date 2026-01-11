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
          DeathDateText(
            birthDate: birthDate,
            deathDate: deathDate,
          ),
        ],
      ),
    );
  }
}

/// A common date text.
class CommonDateText extends StatelessWidget {
  const CommonDateText({
    required this.date,
    required this.onTap,
    super.key,
  });

  /// Date
  final DateTime date;

  /// Callback when tapped
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        formatDate(
          context,
          date,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
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

/// A death date text.
class DeathDateText extends ConsumerWidget {
  const DeathDateText({
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
    return CommonDateText(
      date: deathDate,
      onTap: () async {
        await showPickerForDeathDate(
          context: context,
          ref: ref,
          birthDate: birthDate,
          deathDate: deathDate,
        );
      },
    );
  }
}
