import 'package:flutter/material.dart';
import 'package:life_battery/widgets/battery_indicator.dart';

/// Screen for showing the remaining of lifespan
class LifespanProgressScreen extends StatelessWidget {
  /// Constructor
  const LifespanProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: BatteryIndicator(value: 100),
      ),
    );
  }
}
