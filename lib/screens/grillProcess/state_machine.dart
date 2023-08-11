import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';

class StateMachine {
  late Type _type;
  late State _currentState;
  late ScreenInfo _screenInfo;

  void init(Type type) {
    _type = type;
    _currentState = State.START;
    // _screenInfo = StartState();
  }

  void next() {
    switch (_type) {
      case Type.THIN:
        nextForThin();
        break;
      case Type.THICK:
        nextForThick();
        break;
    }
  }

  void nextForThin() {
    switch (_currentState) {
      case State.START:
        _currentState = State.TIMER_FRONT;
        break;
      case State.TIMER_FRONT:
        _currentState = State.TURN_OVER_FRONT;
        break;
      case State.TURN_OVER_FRONT:
        _currentState = State.TIMER_BACK;
        break;
      case State.TIMER_BACK:
        _currentState = State.TURN_OVER_BACK_WITH_CUTTING;
        break;
      case State.TURN_OVER_BACK_WITH_CUTTING:
        _currentState = State.FINISH;
        break;
      case State.FINISH:
      default:
        break;
    }
  }

  void nextForThick() {
    switch (_currentState) {
      case State.START:
        _currentState = State.TIMER_FRONT;
        break;
      case State.TIMER_FRONT:
        _currentState = State.TURN_OVER_FRONT;
        break;
      case State.TURN_OVER_FRONT:
        _currentState = State.TIMER_BACK;
        break;
      case State.TIMER_BACK:
        _currentState = State.TURN_OVER_BACK_WITH_CUTTING;
        break;
      case State.TURN_OVER_BACK_WITH_CUTTING:
        _currentState = State.TIMER_RIGHT;
        break;
      case State.TIMER_RIGHT:
        _currentState = State.TURN_OVER_RIGHT;
        break;
      case State.TURN_OVER_RIGHT:
        _currentState = State.TIMER_LEFT;
        break;
      case State.TIMER_LEFT:
        _currentState = State.TURN_OVER_LEFT;
        break;
      case State.TURN_OVER_LEFT:
        _currentState = State.FINISH;
        break;
      case State.FINISH:
      default:
        break;
    }
  }
}

enum Type {
  THIN,
  THICK,
}

enum State {
  START,
  TIMER_FRONT,
  TIMER_BACK,
  TIMER_LEFT,
  TIMER_RIGHT,
  TURN_OVER_FRONT,
  TURN_OVER_BACK_WITH_CUTTING,
  TURN_OVER_LEFT,
  TURN_OVER_RIGHT,
  FINISH
}