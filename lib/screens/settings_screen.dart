import 'package:flutter/material.dart';

/// A screen that shows the settings.
class SettingsScreen extends StatelessWidget {
  /// Constructor
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
