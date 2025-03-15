import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/date_utils.dart';
import 'package:life_battery/widgets/date_range_picker_selector.dart';

/// A widget that allows users to select a date range.
class DateRangePicker extends ConsumerWidget {
  /// Constructor
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
  /// Constructor
  const DateRangePickerContent({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime? birthDate;

  /// Death date
  final DateTime? deathDate;

  @override
  Widget build(BuildContext context) {
    final defaultBirthDate = DateTime(2000);
    final defaultDeathDate = DateTime(2100);

    final birthDate = this.birthDate ?? defaultBirthDate;
    final deathDate = this.deathDate ?? defaultDeathDate;

    return Column(
      children: [
        DateRangePickerLabels(
          birthDate: birthDate,
          deathDate: deathDate,
        ),
        DateRangePickerSelector(
          birthDate: birthDate,
          deathDate: deathDate,
        ),
      ],
    );
  }
}

/// A widget that displays the labels of the date range picker.
class DateRangePickerLabels extends StatelessWidget {
  /// Constructor
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BirthDateText(
          birthDate: birthDate,
          deathDate: deathDate,
        ),
        DeathDateText(
          birthDate: birthDate,
          deathDate: deathDate,
        ),
      ],
    );
  }
}

/// A common date text.
class CommonDateText extends StatelessWidget {
  /// Constructor
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

/// A birth date text.
class BirthDateText extends ConsumerWidget {
  /// Constructor
  const BirthDateText({
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
      date: birthDate,
      onTap: () {
        showPickerForBirthDate(
          context: context,
          ref: ref,
          birthDate: birthDate,
          deathDate: deathDate,
        );
      },
    );
  }
}

/// A death date text.
class DeathDateText extends ConsumerWidget {
  /// Constructor
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
      onTap: () {
        showPickerForDeathDate(
          context: context,
          ref: ref,
          birthDate: birthDate,
          deathDate: deathDate,
        );
      },
    );
  }
}
