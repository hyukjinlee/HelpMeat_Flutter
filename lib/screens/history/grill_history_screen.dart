import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';

/// 굽기 이력 화면
class GrillHistoryScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  GrillHistoryScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<GrillHistoryScreen> createState() => _GrillHistoryScreenState();
}

class _GrillHistoryScreenState extends State<GrillHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndicateText(),
      ),
    );
  }
}

class IndicateText extends StatelessWidget {

  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bigTextStyle = TextStyle(fontSize: 25, color: AppThemes.mainPink);
    TextStyle smallTextStyle = TextStyle(fontSize: 10);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '고기 굽기 이력\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '임시 페이지\n',
              style: smallTextStyle,
            ),
          ]
      ),
      textAlign: TextAlign.center,
    );
  }
}

