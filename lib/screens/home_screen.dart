import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/is_initial_user.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
import 'package:life_battery/screens/tutorial_screen.dart';

/// Home screen
class HomeScreen extends ConsumerWidget {
  /// Constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialUser = ref.watch(isInitialUserProvider);

    final l10n = AppLocalizations.of(context)!;

    return switch (isInitialUser) {
      // If the user is initial user, show the tutorial screen
      // Otherwise, show the lifespan progress screen
      AsyncData(:final value) => value
          ? TutorialScreen(
              onDone: () {
                // Navigate to the lifespan progress screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const LifespanProgressScreen(isInitialUser: true),
                  ),
                );
              },
            )
          : const LifespanProgressScreen(isInitialUser: false),
      AsyncError() => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(l10n.generalError),
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    };
  }
}
