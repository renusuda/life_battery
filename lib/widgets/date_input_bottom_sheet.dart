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

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: <Widget>[
          // Display an instruction text only in portrait mode
          // because of the limited space
          if (MediaQuery.of(context).orientation == Orientation.portrait)
            const SizedBox(height: 25),
          if (MediaQuery.of(context).orientation == Orientation.portrait)
            Text(
              l10n.dateInputInstruction,
            ),
          const SizedBox(height: 25),
          const DateRangePicker(),
        ],
      ),
    );
  }
}
