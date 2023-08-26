import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';

/// [7] 최종 완료 및 확인 화면
class FinishSettingsScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  FinishSettingsScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<FinishSettingsScreen> createState() => _FinishSettingsScreenState();
}

class _FinishSettingsScreenState extends State<FinishSettingsScreen>
    with SingleTickerProviderStateMixin {
  double _scale = 0;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 50,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppThemes.screenBackGround,
        padding: EdgeInsets.fromLTRB(10, 100, 10, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IndicateText(args: widget.args,),
            Image(
              image: AssetImage(getIndicateImagePath()),
              width: 250,
              height: 250,
            ),
            GestureDetector(
              onTapDown: (details) => _controller.forward(),
              onTapUp: (details) => {
                _controller.reverse(),
                AppNavigator.push(context, Screens.PROCEED_GRILLING_SCREEN, widget.args)
              },
              child: Transform.scale(
                scale: _scale,
                child: Image(
                  image: AssetImage(getNextButtonImagePath()),
                  width: 150,
                  height: 150,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getIndicateImagePath() {
    final GrillSettingsArguments args = widget.args;
    return ResourceUtils.getFinishSettingsImagePath(args.meatType, args.griddleInfo!.griddleType);
  }

  String getNextButtonImagePath() {
    return '${Constants.GRILL_SETTINGS_RESOURCES_PATH}finish_settings_button_image.png';
  }
}

class IndicateText extends StatelessWidget {
  final GrillSettingsArguments args;

  const IndicateText({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle blackTextStyle = TextStyle(fontSize: 25);
    TextStyle pinkTextStyle = TextStyle(fontSize: 25, color: AppThemes.mainPink);

    return Text.rich(
        TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '자, 이제!\n',
              style: blackTextStyle,
            ),
            TextSpan(
              text: args.fireInfo!.name,
              style: pinkTextStyle,
            ),
            TextSpan(
              text: '과 ',
              style: blackTextStyle,
            ),
            TextSpan(
                text: args.griddleInfo!.name,
                style: pinkTextStyle,
            ),
            TextSpan(
              text: ' 위에서\n',
              style: blackTextStyle,
            ),
            TextSpan(
                text: '${args.meatInfo!.name}(${args.thickness}cm)',
                style: pinkTextStyle,
            ),
            TextSpan(
              text: '을\n구울 준비가 되었습니다!',
              style: blackTextStyle,
            ),
          ]
        ),
      textAlign: TextAlign.center,
    );
  }
}

