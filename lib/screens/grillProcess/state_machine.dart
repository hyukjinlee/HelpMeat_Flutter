import 'package:flutter/material.dart';
import 'package:helpmeat/screens/grillProcess/state/finish_state.dart';
import 'package:helpmeat/screens/grillProcess/state/finish_with_cutting_state.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/screens/grillProcess/state/start_state.dart';
import 'package:helpmeat/screens/grillProcess/state/timer_state.dart';
import 'package:helpmeat/screens/grillProcess/state/turn_over_state.dart';
import 'package:helpmeat/screens/grillProcess/state/turn_over_with_cutting_state.dart';
import 'package:helpmeat/screens/grillProcess/type.dart';

class StateMachine {
  late BuildContext _context;
  late GrillType _type;
  GrillState _currentState = GrillState.NONE;
  late ScreenInfo _screenInfo;
  late void Function() _onFinished;
  late void Function() _onTerminated;

  bool hasGrillState() {
    if (_currentState != GrillState.NONE) {
      return true;
    }
    return false;
  }

  void init(BuildContext context, GrillType type, void Function() onFinished,
      void Function() onTerminated) {
    _context = context;
    _type = type;
    _onFinished = onFinished;
    _onTerminated = onTerminated;
    _currentState = GrillState.START;
    _screenInfo = StartState(context: _context, onFinished: _onFinished);
  }

  ScreenInfo getScreenInfo() {
    return _screenInfo;
  }

  void next() {
    switch (_currentState) {
      case GrillState.START:
        _currentState = GrillState.TIMER_FRONT;
        _screenInfo = TimerState(context: _context, onFinished: _onFinished, grillState: GrillState.TIMER_FRONT);
        break;
      case GrillState.TIMER_FRONT:
        _currentState = GrillState.TURN_OVER_FRONT;
        _screenInfo = TurnOverState(context: _context, onFinished: _onFinished);
        break;
      case GrillState.TURN_OVER_FRONT:
        _currentState = GrillState.TIMER_BACK;
        _screenInfo = TimerState(context: _context, onFinished: _onFinished, grillState: GrillState.TIMER_BACK);
        break;
      default:
        if (_type == GrillType.THIN) {
          _nextForThin();
        } else { // _type == GrillType.THICK
          _nextForThick();
        }
        break;
    }
  }

  void _nextForThin() {
    switch (_currentState) {
      case GrillState.TIMER_BACK:
        _currentState = GrillState.FINISH_WITH_CUTTING;
        _screenInfo = FinishWithCuttingState(context: _context, onFinished: _onFinished, onTerminated: _onTerminated);
        break;
      case GrillState.FINISH_WITH_CUTTING:
        _currentState = GrillState.START;
        _screenInfo = StartState(context: _context, onFinished: _onFinished);
        break;
      default:
        break;
    }
  }

  void _nextForThick() {
    switch (_currentState) {
      case GrillState.TIMER_BACK:
        _currentState = GrillState.TURN_OVER_BACK_WITH_CUTTING;
        _screenInfo = TurnOverWithCuttingState(context: _context, onFinished: _onFinished);
        break;
      case GrillState.TURN_OVER_BACK_WITH_CUTTING:
        _currentState = GrillState.TIMER_LEFT;
        _screenInfo = TimerState(context: _context, onFinished: _onFinished, grillState: GrillState.TIMER_LEFT);
        break;
      case GrillState.TIMER_LEFT:
        _currentState = GrillState.TURN_OVER_LEFT;
        _screenInfo = TurnOverState(context: _context, onFinished: _onFinished);
        break;
      case GrillState.TURN_OVER_LEFT:
        _currentState = GrillState.TIMER_RIGHT;
        _screenInfo = TimerState(context: _context, onFinished: _onFinished, grillState: GrillState.TIMER_RIGHT);
        break;
      case GrillState.TIMER_RIGHT:
        _currentState = GrillState.FINISH;
        _screenInfo = FinishState(context: _context, onFinished: _onFinished, onTerminated: _onTerminated);
        break;
      case GrillState.FINISH:
        _currentState = GrillState.START;
        _screenInfo = StartState(context: _context, onFinished: _onFinished);
        break;
      default:
        break;
    }
  }
}