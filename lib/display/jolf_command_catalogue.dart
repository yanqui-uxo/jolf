import 'package:flutter/material.dart';
import 'package:jolf/commands/jolf_command.dart';

class JolfCommandCatalogue extends StatelessWidget {
  final Iterable<JolfCommand> cmds;

  JolfCommandCatalogue(this.cmds);

  Widget _wrap(Widget w) => FittedBox(
    child: w,
    fit: BoxFit.contain
  );

  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,

      children: [
        for (var c in cmds)
        Draggable(
          child: FittedBox(child: c.appearance, fit: BoxFit.contain),
          feedback: Material(child: SizedBox(
            child: _wrap(c.appearance),
            width: 100,
            height: 100
          )),
          data: c,
          dragAnchorStrategy: pointerDragAnchorStrategy
        )]
    );
  }
}