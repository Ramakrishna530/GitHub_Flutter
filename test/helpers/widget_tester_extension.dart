import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterScreenshot on WidgetTester {
  /// Add `tester.debugTakeScreenshot("debug.png")` anywhere in a widget test
  /// to write a screenshot (to the root of the package, or from where ever the
  /// test was executed) during its execution.
  ///
  /// NOTE: Don't leave this in when committing code!
  Future<void> debugTakeScreenshot(String filename) async {
    final imageFuture = _captureImage(allElements.first);
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    return binding.runAsync<void>(() async {
      final image = await imageFuture;
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      if (bytes == null) {
        throw Exception("Could not encode screenshot.");
      }
      await File(filename).writeAsBytes(bytes.buffer.asUint8List(), flush: true);
      image.dispose();
    });
  }
}

Future<ui.Image> _captureImage(Element element) {
  assert(element.renderObject != null);
  var renderObject = element.renderObject as RenderObject;
  while (!renderObject.isRepaintBoundary) {
    renderObject = renderObject.parent! as RenderObject;
  }
  assert(!renderObject.debugNeedsPaint);
  final layer = renderObject.debugLayer! as OffsetLayer;
  return layer.toImage(renderObject.paintBounds);
}
