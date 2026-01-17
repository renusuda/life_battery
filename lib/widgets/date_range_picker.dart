import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/l10n/app_localizations.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/date_utils.dart';

/// A widget that allows users to select a date range.
class DateRangePicker extends ConsumerWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return switch (lifespanRangeManager) {
      AsyncData(:final value) => DateRangePickerContent(
        birthDate: value.birthDate,
        idealAge: value.idealAge,
      ),
      AsyncError() => Text(l10n.generalError),
      _ => const CircularProgressIndicator(),
    };
  }
}

/// A content of the date range picker.
class DateRangePickerContent extends StatelessWidget {
  const DateRangePickerContent({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Ideal age
  final int idealAge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateRangePickerLabels(
          birthDate: birthDate,
          idealAge: idealAge,
        ),
      ],
    );
  }
}

/// A widget that displays the labels of the date range picker.
class DateRangePickerLabels extends StatelessWidget {
  const DateRangePickerLabels({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Ideal age
  final int idealAge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          BirthDateField(
            birthDate: birthDate,
            idealAge: idealAge,
          ),
          const SizedBox(height: 20),
          IdealLifespanField(
            birthDate: birthDate,
            idealAge: idealAge,
          ),
        ],
      ),
    );
  }
}

/// A birth date field with label.
class BirthDateField extends ConsumerWidget {
  const BirthDateField({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Ideal age
  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            l10n.birthDateLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            await showPickerForBirthDate(
              context: context,
              ref: ref,
              birthDate: birthDate,
              idealAge: idealAge,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              border: Border.all(
                color: theme.colorScheme.outlineVariant,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(context, birthDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// An ideal lifespan field with label and slider.
class IdealLifespanField extends ConsumerWidget {
  const IdealLifespanField({
    required this.birthDate,
    required this.idealAge,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Ideal age
  final int idealAge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    // Ensure minimum age is current age + 1
    // to prevent remaining lifespan from reaching 0%
    final minAge = _getCurrentAge() + 1;
    // Clamp idealAge to valid range to avoid Slider value errors
    final safeIdealAge = idealAge.clamp(minAge, 150);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            l10n.idealLifespanLabel,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        IdealAgeLabel(idealAge: safeIdealAge),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 12,
            overlayShape: SliderComponentShape.noOverlay,
            inactiveTrackColor: Theme.of(
              context,
            ).colorScheme.outlineVariant,
            thumbShape: _CustomSliderThumb(
              thumbRadius: 18,
              borderWidth: 5,
              dotRadius: 3,
              thumbColor: Colors.white,
              borderColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Slider(
            value: safeIdealAge.toDouble(),
            min: minAge.toDouble(),
            max: 150,
            onChanged: (value) {
              unawaited(
                ref
                    .read(lifespanRangeManagerProvider.notifier)
                    .updateLifespanRange(
                      birthDate: birthDate,
                      idealAge: value.toInt(),
                    ),
              );
            },
          ),
        ),
      ],
    );
  }

  int _getCurrentAge() {
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    final thisYearBirthday = DateTime(now.year, birthDate.month, birthDate.day);
    if (now.isBefore(thisYearBirthday)) {
      age--;
    }
    return age;
  }
}

/// A widget that displays the ideal age with unit.
class IdealAgeLabel extends StatelessWidget {
  const IdealAgeLabel({
    required this.idealAge,
    super.key,
  });

  /// The ideal age to display
  final int idealAge;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          key: const Key('idealAgeText'),
          '$idealAge',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          l10n.ageUnit,
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Custom slider thumb with border and center dot.
class _CustomSliderThumb extends SliderComponentShape {
  const _CustomSliderThumb({
    required this.thumbRadius,
    required this.borderWidth,
    required this.dotRadius,
    required this.thumbColor,
    required this.borderColor,
  });

  final double thumbRadius;
  final double borderWidth;
  final double dotRadius;
  final Color thumbColor;
  final Color borderColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Scale up when activated (pressed/dragged)
    const scaleAmount = 0.10;
    final scale = 1.0 + (activationAnimation.value * scaleAmount);
    final scaledThumbRadius = thumbRadius * scale;
    final scaledBorderWidth = borderWidth * scale;
    final scaledDotRadius = dotRadius * scale;

    // Draw white background circle
    final fillPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, scaledThumbRadius, fillPaint);

    // Draw outside border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = scaledBorderWidth;
    canvas.drawCircle(
      center,
      scaledThumbRadius - scaledBorderWidth / 2,
      borderPaint,
    );

    // Draw center dot
    final dotPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, scaledDotRadius, dotPaint);
  }
}
