import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

class FinishState extends ScreenInfo {
  const FinishState({
    required BuildContext context,
    required GrillSettingsArguments args,
    required void Function() onFinished,
    required void Function() onTerminated})
      : super(context: context, args: args, onFinished: onFinished, onTerminated: onTerminated);

  @override
  Widget getTopWidget() {
    return IndicateText();
  }

  @override
  Widget getMiddleWidget() {
    return IndicateImage(imagePath: ResourceUtils.getFinishStateImagePath(args.meatType, args.griddleInfo!.griddleType, args.donenessInfo!.donenessType),);
  }

  @override
  Widget getBottomWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextButton(onPressed: onFinished, text: '똑같이 한번 더 굽기',),
        AppTextButton(onPressed: onTerminated!, text: '완료', invertColor: true),
      ],
    );
  }
}

class IndicateText extends StatelessWidget {
  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = TextStyle(fontSize: 18, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 35, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '이제 맛있게\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '드실 차례에요!\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '기호에 따라 조금 더 구우세요',
              style: smallTextStyle,
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