import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/async_value_widget.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/ideal_age_stepper_field.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';
import 'package:life_battery/src/utils/date_utils.dart';

class DateRangePicker extends ConsumerWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    return AsyncValueWidget(
      asyncValue: lifespanRangeManager,
      data: (value) => DateRangePickerContent(
        birthDate: value.birthDate,
        idealAge: value.idealAge,
      ),
    );
  }
}

class DateRangePickerContent extends StatelessWidget {
  const DateRangePickerContent({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateRangePickerLabels(
          birthDate: birthDate,
          idealAge: idealAge,
        ),
      ],
    );
  }
}

class DateRangePickerLabels extends StatelessWidget {
  const DateRangePickerLabels({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          BirthDateField(
            birthDate: birthDate,
            idealAge: idealAge,
          ),
          const SizedBox(height: 20),
          IdealAgeStepperField(
            birthDate: birthDate,
            idealAge: idealAge,
          ),
        ],
      ),
    );
  }
}

class BirthDateField extends ConsumerWidget {
  const BirthDateField({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
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
            unawaited(AppHaptics.lightImpact());
            await showPickerForBirthDate(
              context: context,
              ref: ref,
              birthDate: birthDate,
              idealAge: idealAge,
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
