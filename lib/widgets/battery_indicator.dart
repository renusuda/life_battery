import 'package:flutter/material.dart';
import 'package:life_battery/models/life_battery_status.dart';

/// A widget that shows the remaining of battery.
class BatteryIndicator extends StatelessWidget {
  /// Constructor
  const BatteryIndicator({
    required this.value,
    required this.text,
    super.key,
  });

  /// battery value
  final int value;

  /// battery text
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BatteryBody(
          value: value,
          text: text,
        ),
        const BatteryKnob(),
      ],
    );
  }
}

/// A widget that shows the body of battery.
class BatteryBody extends StatelessWidget {
  /// Constructor
  const BatteryBody({
    required this.value,
    required this.text,
    super.key,
  });

  /// battery value
  final int value;

  /// battery text
  final String text;

  @override
  Widget build(BuildContext context) {
    const bodyHeight = 150.0;
    final bodyWidth = MediaQuery.of(context).size.width * 0.75;

    return SizedBox(
      height: bodyHeight,
      width: bodyWidth,
      child: Stack(
        children: [
          const BatteryFrame(),
          BatteryBar(
            value: value,
            bodyWidth: bodyWidth,
          ),
          BatteryText(text: text),
        ],
      ),
    );
  }
}

/// A widget that shows the frame of battery.
class BatteryFrame extends StatelessWidget {
  /// Constructor
  const BatteryFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(width: 5),
      ),
    );
  }
}

/// A widget that shows the bar of battery.
class BatteryBar extends StatefulWidget {
  /// Constructor
  const BatteryBar({
    required this.value,
    required this.bodyWidth,
    super.key,
  });

  /// battery value
  final int value;

  /// body width
  final double bodyWidth;

  @override
  State<BatteryBar> createState() => _BatteryBarState();
}

class _BatteryBarState extends State<BatteryBar> {
  @override
  Widget build(BuildContext context) {
    // An animation that transitions the battery indicator from
    // a fully charged state to the specified value.
    return TweenAnimationBuilder(
      tween: IntTween(
        begin: 100,
        end: widget.value,
      ),
      duration: const Duration(seconds: 1),
      builder: (_, value, __) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                const SizedBox.expand(),
                Container(
                  width: widget.bodyWidth * (value / 100),
                  decoration: BoxDecoration(
                    color: LifeBatteryStatus(value).type.color,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// A widget that shows the text of battery.
class BatteryText extends StatelessWidget {
  /// Constructor
  const BatteryText({
    required this.text,
    super.key,
  });

  /// battery text
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// A widget that shows the knob of battery.
class BatteryKnob extends StatelessWidget {
  /// Constructor
  const BatteryKnob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const knobHeight = 35.0;
    const knobWidth = knobHeight / 2;

    return Container(
      width: knobWidth,
      height: knobHeight,
      margin: const EdgeInsets.only(left: 5),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(knobWidth),
          ),
        ),
      ),
    );
  }
}
