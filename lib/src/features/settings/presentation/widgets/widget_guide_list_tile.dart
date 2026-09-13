import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/analytics/data/analytics_repository_provider.dart';
import 'package:life_battery/src/features/settings/presentation/widgets/widget_guide_bottom_sheet.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class WidgetGuideListTile extends ConsumerWidget {
  const WidgetGuideListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.widgets_outlined),
      title: Text(
        l10n.widgetGuideLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () async {
        unawaited(ref.read(analyticsRepositoryProvider).logWidgetGuideView());

        await WidgetGuideBottomSheet.show(context);
      },
    );
  }
}
