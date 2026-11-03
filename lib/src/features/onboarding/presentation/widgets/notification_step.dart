import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/notifications/presentation/providers/notification_schedule_provider.dart';
import 'package:life_battery/src/features/onboarding/presentation/widgets/onboarding_step_layout.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class NotificationStep extends HookConsumerWidget {
  const NotificationStep({required this.onNext, super.key});

  final VoidCallback onNext;

  // Past the 300ms page transition, so the header is read before the system
  // dialog covers it.
  static const _permissionRequestDelay = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isRequesting = useState(false);
    // The system dialog makes the app inactive. It no longer appears once the
    // permission is decided, and moving on without one would only flash this
    // step, so the user moves on by hand then.
    final wasDialogShown = useRef(false);
    final requestTimer = useRef<Timer?>(null);

    useOnAppLifecycleStateChange((_, state) {
      if (isRequesting.value && state == AppLifecycleState.inactive) {
        wasDialogShown.value = true;
      }
    });

    useEffect(() {
      final timer = Timer(_permissionRequestDelay, () async {
        isRequesting.value = true;
        try {
          await ref
              .read(notificationScheduleProvider.notifier)
              .requestPermission();
        } finally {
          if (context.mounted) isRequesting.value = false;
        }
        if (context.mounted && wasDialogShown.value) onNext();
      });
      requestTimer.value = timer;
      return timer.cancel;
    }, const []);

    return OnboardingStepLayout(
      title: l10n.onboardingNotificationTitle,
      description: l10n.onboardingNotificationDescription,
      onPressed: isRequesting.value
          ? null
          : () {
              requestTimer.value?.cancel();
              onNext();
            },
      child: const SizedBox.shrink(),
    );
  }
}
