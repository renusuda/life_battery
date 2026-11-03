import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/lifespan/presentation/providers/battery_label_manager_provider.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class BatteryLabelField extends ConsumerWidget {
  const BatteryLabelField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryLabel = ref.watch(batteryLabelManagerProvider);
    // AsyncValueWidget treats null data as loading, and null is a valid
    // value here.
    if (!batteryLabel.hasValue) return const SizedBox.shrink();

    return BatteryLabelFieldContent(label: batteryLabel.value);
  }
}

class BatteryLabelFieldContent extends HookConsumerWidget {
  const BatteryLabelFieldContent({
    required this.label,
    super.key,
  });

  final String? label;

  // Long enough for a short phrase, short enough to fit in two lines on the
  // small home screen widget.
  static const maxLength = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    // Starts from the default text so users edit it instead of retyping it.
    final controller = useTextEditingController(
      text: label ?? l10n.remainingLifeLabel,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Text(
            l10n.batteryLabelTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLength: maxLength,
          textInputAction: TextInputAction.done,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          onChanged: (value) => unawaited(
            ref
                .read(batteryLabelManagerProvider.notifier)
                .updateBatteryLabel(value),
          ),
          decoration: InputDecoration(
            hintText: l10n.remainingLifeLabel,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
          ),
        ),
      ],
    );
  }
}
