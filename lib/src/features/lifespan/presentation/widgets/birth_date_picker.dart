import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';

class BirthDatePicker extends ConsumerWidget {
  const BirthDatePicker({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  final DateTime birthDate;

  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // The ideal age is fixed, so the birth date is limited to dates that
    // keep the current age below it.
    final minimumDate = DateTime(
      today.year - idealAge,
      today.month,
      today.day + 1,
    );

    final theme = CupertinoTheme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 216,
      child: CupertinoTheme(
        // Fonts with tall line metrics, such as Gurmukhi's Mukta Mahee, are
        // taller than the 32 pt picker rows and get clipped. A fixed line
        // height that fits the row, with even leading, leaves the glyphs of
        // shorter fonts where they were.
        data: theme.copyWith(
          textTheme: textTheme.copyWith(
            dateTimePickerTextStyle: textTheme.dateTimePickerTextStyle.copyWith(
              height: 1.5,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ),
        child: CupertinoDatePicker(
          initialDateTime: birthDate.isBefore(minimumDate)
              ? minimumDate
              : birthDate,
          minimumDate: minimumDate,
          maximumDate: today,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (newBirthDate) {
            unawaited(
              ref
                  .read(lifespanRangeManagerProvider.notifier)
                  .updateLifespanRange(
                    birthDate: newBirthDate,
                    idealAge: idealAge,
                  ),
            );
          },
        ),
      ),
    );
  }
}
