import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jolf/display/grid.dart';
import 'package:jolf/display/jolf_command_catalogue.dart';
import 'package:provider/provider.dart';

import 'display/jolf_code_grid.dart';
import 'jolf_code.dart';
import 'jolf_interpreter.dart';
import 'commands/digit.dart';
import 'commands/halt.dart';
import 'commands/jolf_command.dart';
import 'commands/output.dart';

void main() {
  Widget wrap(Widget w) => FittedBox(child: w, fit: BoxFit.contain);

  var codeMap = {Point(0, 0): Digit(1), Point(0, 1): Digit(2), Point(1, 1): Digit(3)};

  runApp(MaterialApp(
    home: Scaffold(

      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<JolfCode>(
            create: (_) => JolfCode(
              {
                Point(0, 0): Digit(1),
                Point(1, 0): Digit(2),
                Point(2, 2): Digit(3)
              }
            )
          )
        ],
        child: Row(
          children: [
            Expanded(child: JolfCommandCatalogue([Output(), Output(), Digit(1), Digit(2), Digit(3), Digit(4), Halt()])),
            Expanded(child: JolfCodeGrid())
          ]
        )
      )
    )
  ));
}
