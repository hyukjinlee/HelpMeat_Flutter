import 'package:flutter/material.dart';
import 'package:helpmeat/controller/alarm.dart';
import 'package:helpmeat/controller/task.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/screens/grillProcess/type.dart';
import 'package:helpmeat/utils/resources.dart';

class TimerState extends ScreenInfo {
  final GrillState _grillState;

  const TimerState({
    required BuildContext context,
    required GrillSettingsArguments args,
    required void Function() onFinished,
    required GrillState grillState})
      : _grillState = grillState, super(context: context, args: args, onFinished: onFinished);

  @override
  Widget getTopWidget() {
    return IndicateText(grillState: _grillState,);
  }

  @override
  Widget getMiddleWidget() {
    return TimerWidget(onFinished: onFinished, args: args,);
  }

  @override
  Widget getBottomWidget() {
    return SizedBox();
  }
}

class IndicateText extends StatelessWidget {
  final GrillState _grillState;

  const IndicateText({Key? key, required GrillState grillState}): _grillState = grillState, super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = TextStyle(fontSize: 15, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 50, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(style: DefaultTextStyle.of(context).style, children: [
        TextSpan(
          text: '굉장히 맛있게, ${_getSideText()}\n',
          style: smallTextStyle,
        ),
        TextSpan(
          text: '굽는 중\n',
          style: bigTextStyle,
        ),
        TextSpan(
          text: '"군침을 흘려주세요"',
          style: smallTextStyle,
        ),
      ]),
      textAlign: TextAlign.center,
    );
  }

  String _getSideText() {
    switch (_grillState) {
      case GrillState.TIMER_FRONT:
        return '고기 앞면';
      case GrillState.TIMER_BACK:
        return '고기 뒷면';
      case GrillState.TIMER_LEFT:
        return '고기 옆면';
      case GrillState.TIMER_RIGHT:
        return '고기 마지막 면';
      default:
        return '';
    }
  }
}

class TimerWidget extends StatefulWidget {
  final GrillSettingsArguments args;
  final void Function() onFinished;
  const TimerWidget({Key? key, required this.args, required this.onFinished}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  late Animation<double> _animation;
  late AnimationController _controller;

  final int _settingValue = 5;
  int _seconds = 5;

  @override
  void initState() {
    super.initState();

    initTimer();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomPaint(
                    painter: CirclePainter(fraction: _fraction),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  IndicateImage(imagePath: ResourceUtils.getTimerStateImagePath(widget.args.meatType, widget.args.griddleInfo!.griddleType)),
                  Container(
                    width: 100,
                    height: 40,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(AppThemes.hard_radius),
                        color: AppThemes.mainPink),
                    child: Center(
                      child: Text('${_seconds}s',
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initTimer() {
    _controller = AnimationController(duration: Duration(milliseconds: _settingValue * 1000), vsync: this);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
          _seconds = (_settingValue * _fraction).toInt() + 1;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          TaskManager.postDelayed(_settingValue, () {
            AlarmManager.start();
          });
        } else if (status == AnimationStatus.completed) {
          setState(() {
            _seconds = 0;
            widget.onFinished.call();
          });
        }
      });
  }

  void startTimer() {
    _controller.forward();
  }

  void stopTimer() {
    _controller.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final double fraction;
  late Paint _circlePaint;

  CirclePainter({required this.fraction}) {
    _circlePaint = Paint()
      ..color = AppThemes.mainPink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset(0.0, 0.0) & size;
    var pi = 3.141592;

    canvas.drawArc(rect, -pi / 2, -pi * 2 * fraction, false, _circlePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.fraction != fraction;
  }
}

class IndicateImage extends StatelessWidget {
  final String imagePath;
  const IndicateImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imagePath),
      width: 200,
      height: 200,
    );
  }
}