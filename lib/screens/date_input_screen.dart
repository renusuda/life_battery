import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:life_battery/screens/tutorial_screen.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

/// Date input screen
class DateInputScreen extends StatefulWidget {
  /// Constructor
  const DateInputScreen({
    required this.showingTutorial,
    super.key,
  });

  /// showing tutorial
  final bool showingTutorial;

  @override
  State<DateInputScreen> createState() => _DateInputScreenState();
}

class _DateInputScreenState extends State<DateInputScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.showingTutorial) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return const TutorialScreen();
          },
        );
      });
    }
  }

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
