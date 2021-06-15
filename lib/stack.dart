import 'package:flutter/widgets.dart';
import 'package:jolf/exceptions/empty_stack_exception.dart';

import 'exceptions/empty_stack_exception.dart';

class Stack<T> extends ChangeNotifier {
  List<T> _stack = [];

  void push(T x) {
    _stack.add(x);
    notifyListeners();
  }

  T pop() {
    if (_stack.isNotEmpty) {
      return _stack.removeLast();
    } else {
      throw EmptyStackException();
    }
  }
  T peek() {
    if (_stack.isNotEmpty) {
      return _stack.last;
    } else {
      throw EmptyStackException();
    }
  }
}