import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';

String formatDate(
  BuildContext context,
  DateTime date,
) {
  return DateFormat.yMd(
    context.isJapanese ? 'ja' : 'en',
  ).format(date);
}

Future<void> showPickerForBirthDate({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime birthDate,
  required int idealAge,
}) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Theme.of(context).bottomSheetTheme.backgroundColor,
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: birthDate,
          minimumDate: DateTime(1900),
          maximumDate: today,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime newBirthDate) async {
            await ref
                .read(lifespanRangeManagerProvider.notifier)
                .updateLifespanRange(
                  birthDate: newBirthDate,
                  idealAge: idealAge,
                );
          },
        ),
      ),
    ),
  );
}
