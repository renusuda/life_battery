import 'package:flutter/material.dart';

/// Restart widget
class RestartWidget extends StatefulWidget {
  /// Constructor
  const RestartWidget({
    required this.child,
    super.key,
  });

  /// Child widget
  final Widget child;

  /// Restart the app
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
