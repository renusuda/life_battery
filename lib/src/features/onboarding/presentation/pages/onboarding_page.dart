import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/async_value_widget.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/launch_count/presentation/providers/review_request_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/onboarding/domain/onboarding_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/birth_date_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/ideal_age_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_progress_bar.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/result_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/widget_step.dart';

/// The initial-user flag is cleared only on finishing, so leaving midway
/// restarts the flow on the next launch.
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentStep = useState(0);
    final isFinishing = useState(false);
    // Each step is reported once so the funnel counts users, not retries
    // after going back.
    final passedSteps = useRef(<OnboardingStep>{});
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    useEffect(() {
      unawaited(ref.read(analyticsRepositoryProvider).logOnboardingStart());
      return null;
    }, const []);

    void logStepPassed(OnboardingStep step) {
      if (!passedSteps.value.add(step)) return;
      unawaited(
        ref.read(analyticsRepositoryProvider).logOnboardingStep(step: step),
      );
    }

    Future<void> goToStep(int step) {
      currentStep.value = step;
      return pageController.animateToPage(
        step,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    Future<void> finish() async {
      if (isFinishing.value) return;
      isFinishing.value = true;
      unawaited(ref.read(analyticsRepositoryProvider).logOnboardingComplete());
      // Taken before the await: finishing navigates away and disposes this
      // page's ref, while the notifier is kept alive.
      final reviewRequest = ref.read(reviewRequestProvider.notifier);
      await ref
          .read(isInitialUserProvider.notifier)
          .updateUserIsNotInitialUser();
      unawaited(reviewRequest.requestAfterOnboarding());
    }

    return Scaffold(
      body: SafeArea(
        child: AsyncValueWidget(
          asyncValue: lifespanRangeManager,
          data: (lifespanRange) {
            final steps = [
              IdealAgeStep(
                lifespanRange: lifespanRange,
                onNext: () {
                  logStepPassed(OnboardingStep.idealAge);
                  unawaited(goToStep(1));
                },
              ),
              BirthDateStep(
                lifespanRange: lifespanRange,
                onNext: () {
                  logStepPassed(OnboardingStep.birthDate);
                  unawaited(goToStep(2));
                },
              ),
              ResultStep(
                lifespanRange: lifespanRange,
                onNext: () {
                  logStepPassed(OnboardingStep.result);
                  unawaited(goToStep(3));
                },
              ),
              WidgetStep(
                onNext: () {
                  logStepPassed(OnboardingStep.widget);
                  unawaited(finish());
                },
              ),
            ];

            return Column(
              children: [
                OnboardingProgressBar(
                  currentStep: currentStep.value,
                  stepCount: steps.length,
                  onBack: currentStep.value == 0
                      ? null
                      : () => goToStep(currentStep.value - 1),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: steps,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
