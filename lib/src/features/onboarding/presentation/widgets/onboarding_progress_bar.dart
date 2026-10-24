import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnboardingProgressBar extends StatelessWidget {
  const OnboardingProgressBar({
    required this.currentStep,
    required this.stepCount,
    required this.onBack,
    super.key,
  });

  final int currentStep;

  final int stepCount;

  /// Null disables the back button on the first step.
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 24, 0),
      child: Row(
        children: [
          IconButton(
            key: const Key('onboardingBack'),
            color: colorScheme.tertiary,
            icon: Icon(
              defaultTargetPlatform == TargetPlatform.iOS
                  ? Icons.arrow_back_ios_new
                  : Icons.arrow_back,
            ),
            onPressed: onBack,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: (currentStep + 1) / stepCount),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (_, value, _) => ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 3,
                  backgroundColor: colorScheme.outlineVariant,
                  color: colorScheme.inverseSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
