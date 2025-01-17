import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

/// Date input bottom sheet
class DateInputBottomSheet extends StatelessWidget {
  /// Constructor
  const DateInputBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        spacing: 30,
        children: <Widget>[
          Text(
            l10n.dateInputInstruction,
          ),
          const DateRangePicker(),
        ],
      ),
    );
  }
}
