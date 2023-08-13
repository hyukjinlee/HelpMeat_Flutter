import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';

class TimerState extends ScreenInfo {
  const TimerState(
      {required BuildContext context, required void Function() onFinished})
      : super(context: context, onFinished: onFinished);

  @override
  Widget getTopWidget() {
    return IndicateText();
  }

  @override
  Widget getMiddleWidget() {
    return TimerWidget(onFinished: onFinished,);
  }

  @override
  Widget getBottomWidget() {
    return SizedBox();
  }
}

class IndicateText extends StatelessWidget {
  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle =
        TextStyle(fontSize: 15, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 50, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(style: DefaultTextStyle.of(context).style, children: [
        TextSpan(
          text: '굉장히 맛있게\n',
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
}

class TimerWidget extends StatefulWidget {
  final void Function() onFinished;
  const TimerWidget({Key? key, required this.onFinished}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _seconds = 3;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    startTimer();
  }


  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds--;
        if (_seconds < 0) {
          stopTimer();
          widget.onFinished.call();
        }
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(AppThemes.hard_radius),
        color: AppThemes.mainPink
      ),
      child: Center(
        child: Text('${_seconds}s',
            style: TextStyle(fontSize: 25, color: Colors.white)),
      ),
    );
  }
}
