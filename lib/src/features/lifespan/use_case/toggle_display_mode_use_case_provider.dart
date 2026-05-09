import 'package:life_battery/src/features/lifespan/data/lifespan_repository_provider.dart';
import 'package:life_battery/src/features/lifespan/use_case/toggle_display_mode_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toggle_display_mode_use_case_provider.g.dart';

@riverpod
ToggleDisplayModeUseCase toggleDisplayModeUseCase(Ref ref) {
  final repository = ref.watch(lifespanRepositoryProvider);
  return ToggleDisplayModeUseCase(repository: repository);
}
