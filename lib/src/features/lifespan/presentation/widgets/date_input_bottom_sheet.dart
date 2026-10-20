import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_range_picker.dart';

class DateInputBottomSheet extends StatelessWidget {
  const DateInputBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DateRangePicker(),
          ],
        ),
      ),
    );
  }
}
