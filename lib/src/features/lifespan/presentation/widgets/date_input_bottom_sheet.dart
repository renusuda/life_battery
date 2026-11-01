import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_label_field.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/date_range_picker.dart';

class DateInputBottomSheet extends StatelessWidget {
  const DateInputBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: const SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, bottom: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DateRangePicker(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: BatteryLabelField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
