import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/common_widgets/error_view.dart';
import 'package:life_battery/src/common_widgets/loading_view.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.asyncValue,
    required this.data,
    super.key,
  });

  final AsyncValue<T> asyncValue;

  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncValue(:final value?) => data(value),
      AsyncValue(error: != null) => const ErrorView(),
      AsyncValue() => const LoadingView(),
    };
  }
}
