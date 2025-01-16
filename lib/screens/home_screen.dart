import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/screens/date_input_screen.dart';
import 'package:life_battery/screens/lifespan_progress_screen.dart';

/// Home screen
class HomeScreen extends ConsumerWidget {
  /// Constructor
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return switch (lifespanRangeManager) {
      AsyncData(:final value) => value.datesEntered
          ? const LifespanProgressScreen()
          : Scaffold(
              appBar: AppBar(),
              body: const DateInputScreen(showingTutorial: true),
            ),
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
