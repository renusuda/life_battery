import 'package:flutter/material.dart';

/// A widget that allows users to select a date range.
class DateRangePicker extends StatelessWidget {
  /// Constructor
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '2000/01/01',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '2100/01/01',
              style: TextStyle(fontWeight: FontWeight.bold),
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
                  print('Tapped Start Circle');
                },
              ),
              DateRangePickerCircle(
                isStart: false,
                onTap: () {
                  print('Tapped End Circle');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A circle of the date range.
class DateRangePickerCircle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Positioned(
      left: (isStart ? 0.2 : 0.8) * MediaQuery.of(context).size.width - 10,
      top: 40,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Theme.of(context).primaryColor,
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
