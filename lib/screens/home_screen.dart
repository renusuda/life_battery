import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/providers/is_deleted_user.dart';
import 'package:life_battery/providers/is_initial_user.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';
import 'package:life_battery/screens/user_deleted_screen.dart';

/// Home screen
class HomeScreen extends ConsumerWidget {
  /// Constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDeletedUser = ref.watch(isDeletedUserProvider);
    final isInitialUser = ref.watch(isInitialUserProvider);

    return switch (isDeletedUser) {
      // If the user is initial user, show the tutorial screen
      // Otherwise, show the lifespan progress screen
      AsyncData(:final value) =>
        value
            ? const UserDeletedScreen()
            : isInitialUser.when(
                data: (isInitial) =>
                    LifespanProgressScreen(isInitialUser: isInitial),
                error: (error, _) => const ErrorScreen(),
                loading: () => const LoadingScreen(),
              ),
      AsyncError() => const ErrorScreen(),
      _ => const LoadingScreen(),
    };
  }
}

/// Error screen
class ErrorScreen extends StatelessWidget {
  /// Constructor
  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(l10n.generalError),
      ),
    );
  }
}

/// Loading screen
class LoadingScreen extends StatelessWidget {
  /// Constructor
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
