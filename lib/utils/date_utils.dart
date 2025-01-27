import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
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
void showPickerForBirthDate({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime birthDate,
  required DateTime deathDate,
}) {
  _showPickerForDates(
    context: context,
    ref: ref,
    birthDate: birthDate,
    deathDate: deathDate,
    isStart: true,
  );
}

/// Shows a date picker for updating the death date.
void showPickerForDeathDate({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime birthDate,
  required DateTime deathDate,
}) {
  _showPickerForDates(
    context: context,
    ref: ref,
    birthDate: birthDate,
    deathDate: deathDate,
    isStart: false,
  );
}

/// Shows a date picker for updating the date.
void _showPickerForDates({
  required BuildContext context,
  required WidgetRef ref,
  required DateTime birthDate,
  required DateTime deathDate,
  required bool isStart,
}) {
  final today = DateTime.now();

  DatePicker.showDatePicker(
    context,
    minTime: isStart ? DateTime(1900) : today,
    maxTime: isStart ? today : DateTime(2500),
    showTitleActions: false,
    onChanged: (date) {
      ref.read(lifespanRangeManagerProvider.notifier).updateLifespanRange(
            birthDate: isStart ? date : birthDate,
            deathDate: isStart ? deathDate : date,
          );
    },
    currentTime: isStart ? birthDate : deathDate,
    locale: context.isJapanese ? LocaleType.jp : LocaleType.en,
  );
}
