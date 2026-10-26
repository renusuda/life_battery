import 'package:life_battery/src/features/purchases/data/entitlements_repository_provider.dart';
import 'package:life_battery/src/features/purchases/presentation/providers/premium_widget_sync_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_trial_provider.g.dart';

/// keepAlive because [start] is fired and forgotten from the onboarding
/// step; an auto-disposed notifier would lose its ref before the sync.
@Riverpod(keepAlive: true)
class WidgetTrial extends _$WidgetTrial {
  @override
  void build() {}

  /// Starts the free widget trial and pushes it to the widget right away,
  /// since the user adds the widget before finishing the onboarding step.
  Future<void> start() async {
    final started = await ref
        .read(entitlementsRepositoryProvider)
        .startWidgetTrialIfNeeded(now: DateTime.now());
    if (started) ref.invalidate(premiumWidgetSyncProvider);
  }
}
