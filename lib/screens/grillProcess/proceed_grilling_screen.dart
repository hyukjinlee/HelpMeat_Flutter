import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/screens/grillProcess/state_machine.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/utils/util.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// 굽기 진행 페이지
class ProceedGrillingScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  ProceedGrillingScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<ProceedGrillingScreen> createState() => _ProceedGrillingScreenState();
}

class _ProceedGrillingScreenState extends State<ProceedGrillingScreen> {
  final StateMachine _stateMachine = StateMachine();

  @override
  Widget build(BuildContext context) {
    if (!_stateMachine.hasGrillState()) {
      _stateMachine.init(context, Utils.getGrillType(widget.args.thickness!),
          goNextStep, finishGrilling);
    }

    ScreenInfo screenInfo = _stateMachine.getScreenInfo();

    return WillPopScope(
      onWillPop: exitConfirm,
      child: Scaffold(
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
      ),
    );
  }

  void goNextStep() {
    setState(() {
      _stateMachine.next();
    });
  }

  void finishGrilling() {
    AppNavigator.push(context, Screens.GRILL_HISTORY_SCREEN, widget.args);
  }

  Future<bool> exitConfirm() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(AppThemes.radius),
                side: BorderSide(color: AppThemes.mainPink, width: 2)),
            content: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('뒤로 돌아가시겠어요?',
                  style: TextStyle(color: AppThemes.mainPink, fontSize: 20)),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              AlertDialogActionButton(
                text: '계속 굽기',
                onPressed: () => Navigator.of(context).pop(false),
              ),
              AlertDialogActionButton(
                text: '뒤로 가기',
                invertColor: true,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ) ??
        false;
  }
}
