import 'package:flutter/cupertino.dart';
import 'package:helpmeat/screens/grillProcess/type.dart';

/// Resource Utils
class Utils {
  static Rect getWidgetGlobalRect(GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      throw Exception();
    }

    final position = renderBox.localToGlobal(Offset.zero);
    final width = renderBox.size.width;
    final height = renderBox.size.height;

    return Rect.fromLTRB(position.dx, position.dy, position.dx + width, position.dy + height);
  }

  static Rect getWidgetLocalRect(GlobalKey childKey, GlobalKey parentKey) {
    final childRenderBox = childKey.currentContext!.findRenderObject() as RenderBox?;
    if (childRenderBox == null) {
      throw Exception();
    }
    final parentRenderBox = parentKey.currentContext!.findRenderObject() as RenderBox?;
    if (parentRenderBox == null) {
      throw Exception();
    }

    final parentGlobalPosition = parentRenderBox.localToGlobal(Offset.zero);
    final childGlobalPosition = childRenderBox.localToGlobal(Offset.zero);

    final localPosition = Offset(childGlobalPosition.dx - parentGlobalPosition.dx, childGlobalPosition.dy - parentGlobalPosition.dy);

    final width = childRenderBox.size.width;
    final height = childRenderBox.size.height;

    return Rect.fromLTRB(localPosition.dx, localPosition.dy, localPosition.dx + width, localPosition.dy + height);
  }

  static GrillType getGrillType(double thickness) {
    if (thickness > 2.0) {
      return GrillType.THICK;
    }
    return GrillType.THIN;
  }
}