import 'package:flutter/material.dart';

import 'no_arg_jolf_command.dart';
import '../jolf_state.dart';

class Halt extends NoArgJolfCommand {
  final Widget appearance = Text("@");

  void run(JolfState state) {
    state.halt = true;
  }
}