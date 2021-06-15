import 'dart:math';

import 'jolf_code.dart';
import 'jolf_state.dart';
import 'commands/jolf_command.dart';

class JolfInterpreter {
  final JolfState state;

  JolfInterpreter(Map<Point<int>, JolfCommand> code) : state = JolfState(JolfCode(code));

  void step() {
    if (state.code.containsPoint(state.position)) {
      var cmd = state.code.getPoint(state.position);
      cmd.run(state);

      state.position += state.direction;
    }
  }

  void run() {
    while (!state.halt) {
      step();
    }
  }
}