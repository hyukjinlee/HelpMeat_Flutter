
import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

class TurnOverWithCuttingState extends ScreenInfo {
  const TurnOverWithCuttingState({
    required BuildContext context,
    required GrillSettingsArguments args,
    required void Function() onFinished})
      : super(context: context, args: args, onFinished: onFinished);

  @override
  Widget getTopWidget() {
    return IndicateText();
  }

  @override
  Widget getMiddleWidget() {
    return IndicateImage(imagePath: ResourceUtils.getTurnOverWithCuttingStateImagePath(args.meatType),);
  }

  @override
  Widget getBottomWidget() {
    return AppTextButton(onPressed: onFinished, text: '뒤집었다면 터치',);
  }
}

class IndicateText extends StatelessWidget {
  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = TextStyle(fontSize: 18, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 40, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '이제 옆면을 구울 차례입니다!\n',
              style: smallTextStyle,
            ),
            TextSpan(
              text: '기호에 맞게 자르고\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '뒤집어주세요\n',
              style: bigTextStyle,
            ),
          ]
      ),
      textAlign: TextAlign.center,
    );
  }
}

class IndicateImage extends StatelessWidget {
  final String imagePath;
  const IndicateImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imagePath),
      width: 250,
      height: 250,
    );
  }
}