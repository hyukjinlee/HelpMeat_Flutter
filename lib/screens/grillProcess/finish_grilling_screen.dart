import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';

/// 굽기 진행 페이지
class FinishGrillingPage extends StatefulWidget {
  final GrillSettingsArguments args;

  FinishGrillingPage({Key? key, required this.args}) : super(key: key);

  @override
  State<FinishGrillingPage> createState() => _FinishGrillingPageState();
}

class _FinishGrillingPageState extends State<FinishGrillingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IndicateText(),
      ),
    );
  }
}

class IndicateText extends StatelessWidget {

  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bigTextStyle = TextStyle(fontSize: 25);
    TextStyle smallTextStyle = TextStyle(fontSize: 10, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: 'Meat\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: 'Complete\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '"기다린 자, 즐겨라!"',
              style: smallTextStyle,
            ),
          ]
      ),
      textAlign: TextAlign.center,
    );
  }
}

