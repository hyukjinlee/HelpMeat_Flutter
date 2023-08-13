import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/screens/grillProcess/state_machine.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/utils/util.dart';

/// 굽기 진행 페이지
class ProceedGrillingPage extends StatefulWidget {
  final GrillSettingsArguments args;

  ProceedGrillingPage({Key? key, required this.args}) : super(key: key);

  @override
  State<ProceedGrillingPage> createState() => _ProceedGrillingPageState();
}

class _ProceedGrillingPageState extends State<ProceedGrillingPage> {
  final StateMachine _stateMachine = StateMachine();

  @override
  Widget build(BuildContext context) {
    if (!_stateMachine.hasGrillState()) {
      _stateMachine.init(context, Utils.getGrillType(widget.args.thickness!), goNextStep,
      );
    }

    ScreenInfo screenInfo = _stateMachine.getScreenInfo();

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppThemes.screenBackGround,
        padding: EdgeInsets.fromLTRB(10, 100, 10, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            screenInfo.getTopWidget(),
            screenInfo.getMiddleWidget(),
            screenInfo.getBottomWidget(),
          ],
        ),
      ),
    );
  }

  void goNextStep() {
    setState(() {
      _stateMachine.next();
    });
  }
}
