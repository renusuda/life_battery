import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_battery/utils/context_extensions.dart';

/// Formats the given date into a string.
String formatDate(
  BuildContext context,
  DateTime date,
) {
  return DateFormat.yMd(
    context.isJapanese ? 'ja' : 'en',
  ).format(date);
}
