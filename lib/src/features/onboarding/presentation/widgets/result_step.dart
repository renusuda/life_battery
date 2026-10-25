import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// Scales the battery in before decreasing it, unlike the home page which
/// only decreases, to make the first result memorable.
class ResultStep extends HookWidget {
  const ResultStep({
    required this.lifespanRange,
    required this.onNext,
    super.key,
  });

  final LifespanRange lifespanRange;

  final VoidCallback onNext;

  // Lets the page slide finish before anything moves.
  static const _delay = 360;
  static const _appear = 450;
  static const _decrease = 2000;
  static const int _total = _delay + _appear + _decrease;

  static const _appearCurve = Interval(
    _delay / _total,
    (_delay + _appear) / _total,
    curve: Curves.easeOutCubic,
  );
  static const _decreaseCurve = Interval(
    (_delay + _appear) / _total,
    1,
    curve: Curves.easeOutQuart,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final percentage = lifespanRange.remainingLifePercentage(now: now);
    final days = lifespanRange.remainingLifeDays(now: now);

    final controller = useAnimationController(
      duration: const Duration(milliseconds: _total),
    );
    useEffect(() {
      controller.forward();
      return null;
    }, const []);
    final progress = useAnimation(controller);

    final appear = _appearCurve.transform(progress);
    final value = IntTween(
      begin: 100,
      end: percentage,
    ).transform(_decreaseCurve.transform(progress));

    return OnboardingStepLayout(
      title: l10n.onboardingResultTitle(percentage),
      description: l10n.onboardingResultDescription(days.withCommaString),
      onPressed: onNext,
      child: Opacity(
        opacity: appear,
        child: Transform.scale(
          scale: 0.6 + 0.4 * appear,
          child: BatteryIndicator(
            value: value,
            text: '$value%',
            animate: false,
          ),
        ),
      ),
    );
  }
}
