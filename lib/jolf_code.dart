import 'dart:math';

import 'package:flutter/widgets.dart';

import 'commands/jolf_command.dart';

class JolfCode extends ChangeNotifier {
  final Map<Point<int>, JolfCommand> _code;
  Iterable<Point<int>> get points => _code.keys;

  JolfCode(this._code);

  JolfCommand getPoint(Point<int> p) => _code[p]!;

  void setPoint(Point<int> p, JolfCommand cmd) {
    if (_code[p] != cmd) {
      _code[p] = cmd;
      notifyListeners();
    }
  }

  bool containsPoint(Point<int> p) => _code.containsKey(p);
}