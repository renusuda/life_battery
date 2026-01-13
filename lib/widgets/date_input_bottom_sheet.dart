import 'package:flutter/material.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

/// Date input bottom sheet
class DateInputBottomSheet extends StatelessWidget {
  const DateInputBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: const Column(
        children: <Widget>[
          SizedBox(height: 25),
          DateRangePicker(),
        ],
      ),
    );
  }
}
