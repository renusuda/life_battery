import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Formats the given date into a string.
String formatDate(
  BuildContext context,
  DateTime date,
) {
  final locale = Localizations.localeOf(context);
  final isJapanese = locale.languageCode == 'ja';
  return DateFormat.yMd(
    isJapanese ? 'ja' : 'en',
  ).format(date);
}
