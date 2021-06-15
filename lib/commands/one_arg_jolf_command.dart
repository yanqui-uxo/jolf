import 'jolf_command.dart';
import '../jolf_state.dart';
import '../data/jolf_data.dart';
import '../exceptions/bad_type_exception.dart';

abstract class OneArgJolfCommand<T> implements JolfCommand {
  void runInternal(JolfData<T> arg, JolfState state);

  void run(JolfState state) {
    var arg = state.stack.pop();

    if (arg is JolfData<T>) {
      runInternal(arg, state);
    } else {
      throw BadTypeException();
    }
  }
}