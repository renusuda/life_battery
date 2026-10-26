import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_battery/src/common_widgets/primary_button.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/lifespan/domain/lifespan_range.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_header.dart';
import 'package:life_battery/src/features/share/presentation/widgets/share_card_dialog.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:life_battery/src/utils/app_haptics.dart';

/// Scales the battery in before decreasing it, unlike the home page which
/// only decreases, to make the first result memorable. The words wait until
/// the number has settled so they do not compete with it.
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
  static const _batteryAppear = 450;
  static const _batteryDecrease = 2000;
  static const _textFadeIn = 500;
  static const _shareFadeIn = 300;
  static const int _total =
      _delay + _batteryAppear + _batteryDecrease + _textFadeIn + _shareFadeIn;

  static const _batteryAppearCurve = Interval(
    _delay / _total,
    (_delay + _batteryAppear) / _total,
    curve: Curves.easeOutCubic,
  );
  static const _batteryDecreaseCurve = Interval(
    (_delay + _batteryAppear) / _total,
    (_delay + _batteryAppear + _batteryDecrease) / _total,
    curve: Curves.easeOutQuart,
  );
  static const _textFadeInCurve = Interval(
    (_delay + _batteryAppear + _batteryDecrease) / _total,
    (_delay + _batteryAppear + _batteryDecrease + _textFadeIn) / _total,
    curve: Curves.easeOut,
  );
  static const _shareFadeInCurve = Interval(
    (_delay + _batteryAppear + _batteryDecrease + _textFadeIn) / _total,
    1,
    curve: Curves.easeOut,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
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

    final batteryAppear = _batteryAppearCurve.transform(progress);
    final value = IntTween(
      begin: 100,
      end: percentage,
    ).transform(_batteryDecreaseCurve.transform(progress));
    // A click per percent makes the decrease felt, slowing down with the
    // curve until it stops.
    final shownValue = useRef(value);
    if (shownValue.value != value) {
      shownValue.value = value;
      unawaited(AppHaptics.selectionClick());
    }
    final textFadeIn = _textFadeInCurve.transform(progress);
    final shareFadeIn = _shareFadeInCurve.transform(progress);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Opacity(
          opacity: textFadeIn,
          child: Transform.translate(
            offset: Offset(0, 16 * (1 - textFadeIn)),
            child: OnboardingStepHeader(
              title: l10n.onboardingResultTitle(percentage),
              description: l10n.onboardingResultDescription(
                days.withCommaString,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Opacity(
              opacity: batteryAppear,
              child: Transform.scale(
                scale: 0.6 + 0.4 * batteryAppear,
                child: BatteryIndicator(
                  value: value,
                  text: '$value%',
                  animate: false,
                ),
              ),
            ),
          ),
        ),
        // Offered right after the first result, when the number is most
        // worth telling someone; it arrives last so the words land first.
        Opacity(
          opacity: shareFadeIn,
          child: Transform.translate(
            offset: Offset(0, 16 * (1 - shareFadeIn)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.onSurface,
                  side: BorderSide(color: colorScheme.outline),
                  minimumSize: const Size.fromHeight(56),
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: shareFadeIn < 1
                    ? null
                    : () async {
                        unawaited(AppHaptics.lightImpact());
                        await ShareCardDialog.show(
                          context,
                          percentage: percentage,
                          text: '$percentage%',
                        );
                      },
                icon: Icon(
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? Icons.ios_share
                      : Icons.share_outlined,
                ),
                label: Text(l10n.shareLabel),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: PrimaryButton(
            onPressed: onNext,
            child: Text(l10n.onboardingContinueLabel),
          ),
        ),
      ],
    );
  }
}
