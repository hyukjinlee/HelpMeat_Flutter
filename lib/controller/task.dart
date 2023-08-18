
import 'dart:async';

class TaskManager {
  static late Timer _timer;

  static void postDelayed(int seconds, void Function() task) {
    _timer = Timer(Duration(seconds: seconds), task);
  }

  static void cancel() {
    _timer.cancel();
  }
}