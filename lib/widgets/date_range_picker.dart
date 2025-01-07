import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/context_extensions.dart';
import 'package:life_battery/utils/date_utils.dart';

/// A widget that allows users to select a date range.
class DateRangePicker extends ConsumerWidget {
  /// Constructor
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifespanRangeManager = ref.watch(lifespanRangeManagerProvider);

    final l10n = AppLocalizations.of(context)!;

    return switch (lifespanRangeManager) {
      AsyncData(:final value) => DateRangePickerContent(
          birthDate: value.birthDate,
          deathDate: value.deathDate,
        ),
      AsyncError() => Text(l10n.generalError),
      _ => const CircularProgressIndicator(),
    };
  }
}

/// A content of the date range picker.
class DateRangePickerContent extends ConsumerWidget {
  /// Constructor
  const DateRangePickerContent({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime? birthDate;

  /// Death date
  final DateTime? deathDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultBirthDate = DateTime(2000);
    final defaultDeathDate = DateTime(2100);

    final birthDate = this.birthDate ?? defaultBirthDate;
    final deathDate = this.deathDate ?? defaultDeathDate;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              formatDate(
                context,
                birthDate,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              formatDate(
                context,
                deathDate,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Stack(
            children: [
              const DateRangePickerLine(),
              DateRangePickerCircle(
                isStart: true,
                onTap: () {
                  _showDatePicker(
                    context: context,
                    ref: ref,
                    initialDate: birthDate,
                    birthDate: birthDate,
                    deathDate: deathDate,
                    isStart: true,
                  );
                },
              ),
              DateRangePickerCircle(
                isStart: false,
                onTap: () {
                  _showDatePicker(
                    context: context,
                    ref: ref,
                    initialDate: deathDate,
                    birthDate: birthDate,
                    deathDate: deathDate,
                    isStart: false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDatePicker({
    required BuildContext context,
    required WidgetRef ref,
    required DateTime initialDate,
    required DateTime birthDate,
    required DateTime deathDate,
    required bool isStart,
  }) {
    final initialYear = initialDate.year;
    final initialMonth = initialDate.month;
    final initialDay = initialDate.day;

    final initialDateTime = DateTime(initialYear, initialMonth, initialDay);

    final today = DateTime.now();
    final todayYear = today.year;
    final todayMonth = today.month;
    final todayDay = today.day;

    final todayDateTime = DateTime(todayYear, todayMonth, todayDay);

    DatePicker.showDatePicker(
      context,
      minTime: isStart ? DateTime(1900) : todayDateTime,
      maxTime: isStart ? todayDateTime : DateTime(2500),
      onConfirm: (date) {
        ref.read(lifespanRangeManagerProvider.notifier).updateLifespanRange(
              birthDate: isStart ? date : birthDate,
              deathDate: isStart ? deathDate : date,
            );
      },
      currentTime: initialDateTime,
      locale: context.isJapanese ? LocaleType.jp : LocaleType.en,
    );
  }
}

/// A circle of the date range.
class DateRangePickerCircle extends StatefulWidget {
  /// Constructor
  const DateRangePickerCircle({
    required this.isStart,
    required this.onTap,
    super.key,
  });

  /// Is start
  final bool isStart;

  /// On tap event
  final VoidCallback onTap;

  @override
  DateRangePickerCircleState createState() => DateRangePickerCircleState();
}

/// A state of the date range picker circle.
class DateRangePickerCircleState extends State<DateRangePickerCircle>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final _animation = Tween<double>(begin: 0.7, end: 1.3).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:
          (widget.isStart ? 0.2 : 0.8) * MediaQuery.of(context).size.width - 10,
      top: 40,
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: _animation,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

/// A line of the date range.
class DateRangePickerLine extends StatelessWidget {
  /// Constructor
  const DateRangePickerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 100),
      painter: DateRangePickerLinePainter(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

/// A custom painter for the date range picker UI.
class DateRangePickerLinePainter extends CustomPainter {
  /// Constructor
  DateRangePickerLinePainter({
    required this.color,
  });

  /// Color
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final startX = 0.2 * size.width;
    final endX = 0.8 * size.width;

    canvas.drawLine(
      Offset(startX, size.height / 2),
      Offset(endX, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
