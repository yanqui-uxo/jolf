import 'package:flutter/material.dart';
import '../jolf_state.dart';
import '../data/jolf_num.dart';
import 'no_arg_jolf_command.dart';

class Digit extends NoArgJolfCommand {
  final Widget appearance;

  final num _n;
  Digit(this._n) : appearance = Text(_n.toString()) {
    if (_n < 0 || _n > 9) {
      throw Exception('Bad argument $_n; can only push a number between 0 and 9');
    }
  }

  void run(JolfState state) {
    state.stack.push(JolfNum(_n));
  }
}