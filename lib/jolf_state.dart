import 'dart:math';

import 'package:jolf/jolf_code.dart';

import 'data/jolf_data.dart';
import 'stack.dart';

class JolfState {
  JolfCode code;
  Stack<JolfData> stack = Stack();
  Point<int> position = Point(0, 0);
  Point<int> direction = Point(1, 0);

  bool halt = false;

  JolfState(this.code);
}