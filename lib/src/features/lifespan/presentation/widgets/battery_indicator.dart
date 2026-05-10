import 'package:flutter/material.dart';
import 'package:life_battery/src/features/lifespan/domain/life_battery_status.dart';

class BatteryIndicator extends StatelessWidget {
  const BatteryIndicator({
    required this.value,
    required this.text,
    super.key,
  });

  final int value;

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

class BatteryBody extends StatelessWidget {
  const BatteryBody({
    required this.value,
    required this.text,
    super.key,
  });

  final int value;

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

class BatteryFrame extends StatelessWidget {
  const BatteryFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          width: 5,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}

class BatteryBar extends StatelessWidget {
  const BatteryBar({
    required this.value,
    required this.bodyWidth,
    super.key,
  });

  final int value;

  final double bodyWidth;

  @override
  Widget build(BuildContext context) {
    // An animation that transitions the battery indicator from
    // a fully charged state to the specified value.
    return TweenAnimationBuilder(
      tween: IntTween(
        begin: 100,
        end: value,
      ),
      duration: const Duration(seconds: 1),
      builder: (_, value, _) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                const SizedBox.expand(),
                Container(
                  width: bodyWidth * (value / 100),
                  decoration: BoxDecoration(
                    color: LifeBatteryStatus(value).color,
                    boxShadow: LifeBatteryStatus(value).boxShadow(context),
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

class BatteryText extends StatelessWidget {
  const BatteryText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class BatteryKnob extends StatelessWidget {
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
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(knobWidth),
          ),
        ),
      ),
    );
  }
}
