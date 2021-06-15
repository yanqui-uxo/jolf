import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jolf/display/default_border_box_decoration.dart';

class Grid extends StatelessWidget {
  final Map<Point<int>, Widget> widgetPoints;
  final Widget Function(Widget?, Point<int>) wrapWidget;
  final Rectangle<int> rectangle;

  static Rectangle<int> generateRect(Iterable<Point> points) {
    var minX;
    var minY;

    var maxX;
    var maxY;

    if (points.isNotEmpty) {
      for (var p in points) {
        minX ??= p.x;
        minY ??= p.y;
        maxX ??= p.x;
        maxY ??= p.y;

        if (p.x < minX) { minX = p.x; }
        if (p.y < minY) { minY = p.y; }
        if (p.x > maxX) { maxX = p.x; }
        if (p.y > maxY) { maxY = p.y; }
      }
      return Rectangle<int>.fromPoints(Point(minX, minY), Point(maxX, maxY));
    } else {
      return Rectangle<int>.fromPoints(Point(0, 0), Point(0, 0));
    }
  }

  Grid({required this.widgetPoints, required this.wrapWidget}) : rectangle = generateRect(widgetPoints.keys);

  Widget generateWidget(Point<int> p) {
    var widget;
    if (widgetPoints.containsKey(p)) {
      widget = widgetPoints[p];
    } else {
      widget = SizedBox(width: 1, height: 1);
    }

    return wrapWidget(widget, p);
  }

  Widget generateGrid() {
    Row generateRow(int y) {
      List<Widget> children = [];

      for (int x = rectangle.left; x <= rectangle.right; x++) {
        children.add(generateWidget(Point(x, y)));
      }

      return Row(children: children);
    }

    return AspectRatio(
      aspectRatio: (rectangle.width + 1) / (rectangle.height + 1),
      child: Column(
        children: [for (int y = rectangle.top; y <= rectangle.bottom; y++) Expanded(child: generateRow(y))],
        crossAxisAlignment: CrossAxisAlignment.stretch
      )
    );
  }

  Widget build(BuildContext context) {
    return generateGrid();
  }
}