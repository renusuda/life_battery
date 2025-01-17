import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// A screen that shows the tutorial.
class TutorialScreen extends StatelessWidget {
  /// Constructor
  const TutorialScreen({
    required this.onDone,
    super.key,
  });

  /// Callback when Done button is pressed
  final VoidCallback onDone;

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
        PageViewModel(
          title: '日付入力2',
          body: '生年月日と目標とする寿命を入力できます。',
          image: const Image(
            image: AssetImage('assets/images/test.png'),
          ),
        ),
        PageViewModel(
          title: '日付入力3',
          body: '生年月日と目標とする寿命を入力できます。',
          image: const Image(
            image: AssetImage('assets/images/test.png'),
          ),
        ),
      ],
      dotsDecorator: DotsDecorator(
        activeColor: Theme.of(context).colorScheme.primary,
      ),
      showBackButton: true,
      back: const PageTransitionIcon(icon: Icons.arrow_back),
      next: const PageTransitionIcon(icon: Icons.arrow_forward),
      done: const PageTransitionIcon(icon: Icons.check),
      onDone: onDone,
    );
  }
}

/// A widget that shows a page transition icon.
class PageTransitionIcon extends StatelessWidget {
  /// Constructor
  const PageTransitionIcon({
    required this.icon,
    super.key,
  });

  /// Icon
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
