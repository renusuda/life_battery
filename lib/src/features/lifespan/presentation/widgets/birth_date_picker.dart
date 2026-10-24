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

    return SizedBox(
      height: 216,
      child: CupertinoDatePicker(
        initialDateTime: birthDate,
        minimumDate: DateTime(1900),
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
    );
  }
}
