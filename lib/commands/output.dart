import 'package:flutter/material.dart';

import 'one_arg_jolf_command.dart';
import '../data/jolf_data.dart';

class Output extends OneArgJolfCommand<dynamic> {
  final Widget appearance = Text('.');

  void runInternal(JolfData arg, _) {
    print(arg.data);
  }
}