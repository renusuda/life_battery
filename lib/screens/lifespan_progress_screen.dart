import 'package:flutter/material.dart';

/// Screen for showing the remaining of lifespan
class LifespanProgressScreen extends StatelessWidget {
  /// Constructor
  const LifespanProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          spacing: 30,
          children: <Widget>[
            Text(
              'Lifespan Progress',
            ),
          ],
        ),
      ),
    );
  }
}
