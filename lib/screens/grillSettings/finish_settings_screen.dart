import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';

/// [7] 최종 완료 및 확인 화면
class FinishSettingsScreen extends StatelessWidget {
  final GrillSettingsArguments args;

  FinishSettingsScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppThemes.screenBackGround,
        padding: EdgeInsets.fromLTRB(10, 100, 10, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IndicateText(args: args,),
            Image(
              image: AssetImage(getIndicateImagePath()),
              width: 150,
              height: 150,
            ),
            IconButton(
              icon: Image(image: AssetImage(getNextButtonImagePath()),),
              iconSize: 150,
              onPressed: () => {
                // TODO
              },
            )
          ],
        ),
      ),
    );
  }

  String getIndicateImagePath() {
    return 'assets/beef_well_done.png';
  }

  String getNextButtonImagePath() {
    return 'assets/finish_settings_button_image.png';
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

