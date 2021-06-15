import 'package:flutter/material.dart';

import '../jolf_state.dart';

abstract class JolfCommand {
  Widget get appearance;

  void run(JolfState state);
}