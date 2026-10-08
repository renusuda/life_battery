import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Future<Uint8List> captureRepaintBoundaryPng(
  GlobalKey key, {
  double pixelRatio = 3,
}) async {
  // toImage asserts on a boundary that has not painted yet, which is the
  // case right after the dialog opens.
  RenderRepaintBoundary? boundary;
  var attempts = 0;
  do {
    await WidgetsBinding.instance.endOfFrame;
    boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    attempts++;
  } while ((boundary == null || boundary.debugNeedsPaint) && attempts < 10);
  if (boundary == null) {
    throw StateError('RepaintBoundary was never mounted');
  }

  final image = await boundary.toImage(pixelRatio: pixelRatio);
  try {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  } finally {
    image.dispose();
  }
}
