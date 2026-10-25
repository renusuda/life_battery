import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/async_value_widget.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/lifespan_range_manager_provider.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/birth_date_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/ideal_age_step.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_progress_bar.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/result_step.dart';

/// The initial-user flag is cleared only on finishing, so leaving midway
/// restarts the flow on the next launch.
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentStep = useState(0);
    final isFinishing = useState(false);
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    useEffect(() {
      unawaited(ref.read(analyticsRepositoryProvider).logOnboardingStart());
      return null;
    }, const []);

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
      await ref
          .read(isInitialUserProvider.notifier)
          .updateUserIsNotInitialUser();
    }

    return Scaffold(
      body: SafeArea(
        child: AsyncValueWidget(
          asyncValue: lifespanRangeManager,
          data: (lifespanRange) {
            final steps = [
              IdealAgeStep(
                lifespanRange: lifespanRange,
                onNext: () => goToStep(1),
              ),
              BirthDateStep(
                lifespanRange: lifespanRange,
                onNext: () => goToStep(2),
              ),
              ResultStep(lifespanRange: lifespanRange, onNext: finish),
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
