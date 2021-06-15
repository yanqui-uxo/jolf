import 'package:flutter/material.dart';
import 'package:jolf/commands/jolf_command.dart';
import 'package:jolf/display/default_border_box_decoration.dart';
import 'package:jolf/jolf_code.dart';
import 'package:provider/provider.dart';

import 'grid.dart';

class JolfCodeGrid extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<JolfCode>(
      builder: (_, code, __) => Grid(
        widgetPoints: {
          for (var p in code.points)
          p: code.getPoint(p).appearance
        },
        wrapWidget: (w, p) {
          w ??= SizedBox(width: 1, height: 1);

          return Expanded(
            child: Container(
              child: DragTarget<JolfCommand>(
                builder: (_, __, ___) => FittedBox(
                  child: w,
                  fit: BoxFit.contain
                ),
                onAccept: (c) => code.setPoint(p, c)
              ),
              decoration: DefaultBorderBoxDecoration()
            )
          );
        }
      ),
    );
  }

}