import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
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
        SaveButton(
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
        Text(
          formatDate(
            context,
            birthDate,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formatDate(
            context,
            deathDate,
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Save button
class SaveButton extends ConsumerWidget {
  /// Constructor
  const SaveButton({
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

    return ElevatedButton(
      onPressed: () {
        ref.read(lifespanRangeManagerProvider.notifier).updateLifespanRange(
              birthDate: birthDate,
              deathDate: deathDate,
            );
        // Navigate to the lifespan progress screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const LifespanProgressScreen(),
          ),
        );
      },
      child: Text(
        l10n.save,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
