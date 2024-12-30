import 'package:flutter/material.dart';
import 'package:life_battery/screens/date_input_screen.dart';

void main() {
  runApp(const App());
}

/// Application
class App extends StatelessWidget {
  /// Constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Battery',
      theme: ThemeData(
        primaryColor: const Color(0xFF4CAF50),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFF4CAF50),
            backgroundColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const DateInputScreen(),
    );
  }
}
