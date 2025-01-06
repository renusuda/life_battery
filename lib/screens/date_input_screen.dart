import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

/// Date input screen
class DateInputScreen extends StatelessWidget {
  /// Constructor
  const DateInputScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 30,
          children: <Widget>[
            Text(
              l10n.dateInputInstruction,
            ),
            const DateRangePicker(),
            const SaveButton(),
          ],
        ),
      ),
    );
  }
}

/// Save button
class SaveButton extends StatelessWidget {
  /// Constructor
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: () {
        print('Save button tapped');
      },
      child: Text(
        l10n.save,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
