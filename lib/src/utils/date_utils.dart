import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/birth_date_picker.dart';

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
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Theme.of(context).bottomSheetTheme.backgroundColor,
      child: SafeArea(
        top: false,
        child: BirthDatePicker(birthDate: birthDate, idealAge: idealAge),
      ),
    ),
  );
}
