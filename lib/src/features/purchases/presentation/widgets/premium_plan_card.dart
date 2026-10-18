import 'package:flutter/material.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

/// A selectable card showing one plan's payment terms with its price on
/// the trailing edge.
class PremiumPlanCard extends StatelessWidget {
  const PremiumPlanCard({
    required this.title,
    required this.price,
    required this.notes,
    required this.isSelected,
    required this.isRecommended,
    required this.onTap,
    super.key,
  });

  final String title;
  final String price;
  final List<String> notes;
  final bool isSelected;
  final bool isRecommended;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final borderRadius = BorderRadius.circular(20);
    final noteStyle = theme.textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? colorScheme.inverseSurface
                : colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isRecommended)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.inverseSurface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            l10n.recommendedPlanBadgeLabel,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onInverseSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  for (final note in notes) Text(note, style: noteStyle),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text(
              price,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
