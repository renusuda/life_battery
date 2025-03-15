import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:life_battery/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;

    final locale = Localizations.localeOf(context);
    final isJapanese = locale.languageCode == 'ja';
    final languageCode = isJapanese ? 'ja' : 'en';

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: l10n.firstTutorialPageTitle,
          body: l10n.firstTutorialPageBody,
          image: Image(
            image: AssetImage('assets/images/first_tutorial_$languageCode.gif'),
          ),
          decoration: const PageDecoration(
            imageFlex: 2,
          ),
        ),
        PageViewModel(
          title: l10n.secondTutorialPageTitle,
          body: l10n.secondTutorialPageBody,
          image: Image(
            image:
                AssetImage('assets/images/second_tutorial_$languageCode.gif'),
          ),
          decoration: const PageDecoration(
            imageFlex: 2,
          ),
        ),
        PageViewModel(
          title: l10n.thirdTutorialPageTitle,
          body: l10n.thirdTutorialPageBody,
          image: Image(
            image: AssetImage('assets/images/third_tutorial_$languageCode.gif'),
          ),
          decoration: const PageDecoration(
            imageFlex: 2,
          ),
        ),
      ],
      dotsDecorator: DotsDecorator(
        activeColor: Theme.of(context).colorScheme.primary,
      ),
      showBackButton: true,
      back: const PageTransitionIcon(icon: Icons.arrow_back),
      next: const PageTransitionIcon(icon: Icons.arrow_forward),
      done: PageTransitionIcon(
        icon: Icons.check,
        color: Theme.of(context).colorScheme.primary,
      ),
      onDone: onDone,
    );
  }
}

/// A widget that shows a page transition icon.
class PageTransitionIcon extends StatelessWidget {
  /// Constructor
  const PageTransitionIcon({
    required this.icon,
    this.color,
    super.key,
  });

  /// Icon
  final IconData icon;

  /// Color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? Theme.of(context).colorScheme.tertiary,
    );
  }
}
