import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// A screen that shows the tutorial.
class TutorialScreen extends StatelessWidget {
  /// Constructor
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: '日付入力',
          body: '生年月日と目標とする寿命を入力できます。',
          image: const Image(
            image: AssetImage('assets/images/test.png'),
          ),
        ),
      ],
      next: const Icon(Icons.arrow_forward),
      done: const Icon(Icons.check),
      onDone: () {
        Navigator.of(context).pop();
      },
    );
  }
}
