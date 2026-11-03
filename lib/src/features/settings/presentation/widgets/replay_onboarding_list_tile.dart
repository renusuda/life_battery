import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user_provider.dart';
import 'package:life_battery/src/routing/app_route.dart';

/// Debug builds only, so the text is not localized.
class ReplayOnboardingListTile extends ConsumerWidget {
  const ReplayOnboardingListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.replay_outlined),
      title: const Text('Replay onboarding (debug)'),
      onTap: () async {
        await ref
            .read(isInitialUserProvider.notifier)
            .updateUserIsInitialUser();
        if (!context.mounted) return;
        context.goNamed(AppRoute.home.name);
      },
    );
  }
}
