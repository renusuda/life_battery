import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/lifespan_progress_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/pages/user_deleted_page.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_deleted_user.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/is_initial_user.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// Home page
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDeletedUser = ref.watch(isDeletedUserProvider);
    final isInitialUser = ref.watch(isInitialUserProvider);

    return switch (isDeletedUser) {
      // If the user is initial user, show the tutorial page
      // Otherwise, show the lifespan progress page
      AsyncData(:final value) =>
        value
            ? const UserDeletedPage()
            : isInitialUser.when(
                data: (isInitial) =>
                    LifespanProgressPage(isInitialUser: isInitial),
                error: (error, _) => const ErrorPage(),
                loading: () => const LoadingPage(),
              ),
      AsyncError() => const ErrorPage(),
      _ => const LoadingPage(),
    };
  }
}

/// Error page
class ErrorPage extends StatelessWidget {
  const ErrorPage({
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

/// Loading page
class LoadingPage extends StatelessWidget {
  const LoadingPage({
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
