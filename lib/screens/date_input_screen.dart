import 'package:flutter/material.dart';
import 'package:life_battery/widgets/date_range_picker.dart';

/// Date input screen
class DateInputScreen extends StatelessWidget {
  /// Constructor
  const DateInputScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 30,
          children: <Widget>[
            const Text(
              '生年月日と目標とする寿命を入力してください。\nそこから、残りの時間を計算できます。',
            ),
            DateRangePicker(),
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
    return ElevatedButton(
      onPressed: () {
        print('Save button tapped');
      },
      child: const Text(
        '保存',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
