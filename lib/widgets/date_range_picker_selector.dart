import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/providers/lifespan_range_manager.dart';
import 'package:life_battery/utils/extensions.dart';

/// A widget that allows users to select a date range.
class DateRangePickerSelector extends ConsumerWidget {
  /// Constructor
  const DateRangePickerSelector({
    required this.birthDate,
    required this.deathDate,
    super.key,
  });

  /// Birth date
  final DateTime birthDate;

  /// Death date
  final DateTime deathDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Stack(
        alignment: Alignment.center,
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
    final today = DateTime.now();

    DatePicker.showDatePicker(
      context,
      minTime: isStart ? DateTime(1900) : today,
      maxTime: isStart ? today : DateTime(2500),
      showTitleActions: false,
      onChanged: (date) {
        ref.read(lifespanRangeManagerProvider.notifier).updateLifespanRange(
              birthDate: isStart ? date : birthDate,
              deathDate: isStart ? deathDate : date,
            );
      },
      currentTime: initialDate,
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
      left: widget.isStart ? 0 : null,
      right: widget.isStart ? null : 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          // Add a transparent container to make tap area bigger
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.onTap,
            child: Container(
              width: 60,
              height: 60,
              color: Colors.transparent,
            ),
          ),
        ],
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
    return Positioned(
      left: 30,
      right: 30,
      child: Container(
        height: 4,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
