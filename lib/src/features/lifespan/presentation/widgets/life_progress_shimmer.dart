import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/presentation/widgets/battery_indicator.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class LifeProgressShimmer extends StatelessWidget {
  const LifeProgressShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final base = Theme.of(context).colorScheme.secondary;
    final highlight = Color.lerp(base, Colors.white, 0.4)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: const BatteryIndicator(value: 100, text: ''),
        ),
        const SizedBox(height: 32),
        Opacity(
          opacity: 0,
          child: Text(
            l10n.longPressToEditHint,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
