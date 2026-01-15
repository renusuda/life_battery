import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/extensions.dart';

/// Formats the given date into a string.
String formatDate(
  BuildContext context,
  DateTime date,
) {
  return DateFormat.yMd(
    context.isJapanese ? 'ja' : 'en',
  ).format(date);
}

/// Shows a date picker for updating the birth date.
Future<void> showPickerForBirthDate({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime birthDate,
  required DateTime deathDate,
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
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
          initialDateTime: birthDate,
          minimumDate: DateTime(1900),
          maximumDate: today,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) async {
            await ref
                .read(lifespanRangeManagerProvider.notifier)
                .updateLifespanRange(
                  birthDate: date,
                  deathDate: deathDate,
                );
          },
        ),
      ),
    ),
  );
}
