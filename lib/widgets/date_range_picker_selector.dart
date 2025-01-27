import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_battery/utils/date_utils.dart';

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
              showPickerForBirthDate(
                context: context,
                ref: ref,
                birthDate: birthDate,
                deathDate: deathDate,
              );
            },
          ),
          DateRangePickerCircle(
            isStart: false,
            onTap: () {
              showPickerForDeathDate(
                context: context,
                ref: ref,
                birthDate: birthDate,
                deathDate: deathDate,
              );
            },
          ),
        ],
      ),
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
