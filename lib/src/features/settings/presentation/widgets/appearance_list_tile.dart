import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/async_value_widget.dart';
import 'package:life_battery/src/extensions/extensions.dart';
import 'package:life_battery/src/features/settings/presentation/providers/app_theme_mode_provider.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class AppearanceListTile extends ConsumerWidget {
  const AppearanceListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeMode = ref.watch(appThemeModeProvider);
    final l10n = AppLocalizations.of(context)!;

    return AsyncValueWidget(
      asyncValue: appThemeMode,
      data: (value) => PopupMenuButton<ThemeMode>(
        initialValue: value,
        position: PopupMenuPosition.over,
        offset: const Offset(100, 0),
        onSelected: (ThemeMode mode) async {
          await ref.read(appThemeModeProvider.notifier).updateThemeMode(mode);
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
          PopupMenuItem<ThemeMode>(
            value: ThemeMode.system,
            child: Text(
              l10n.systemLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PopupMenuItem<ThemeMode>(
            value: ThemeMode.light,
            child: Text(
              l10n.lightLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PopupMenuItem<ThemeMode>(
            value: ThemeMode.dark,
            child: Text(
              l10n.darkLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        child: ListTile(
          leading: const Icon(Icons.wb_sunny_outlined),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.appearanceLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value.label(l10n),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.unfold_more),
        ),
      ),
    );
  }
}
