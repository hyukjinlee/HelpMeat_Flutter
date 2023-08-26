import 'package:flutter/material.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

class FinishWithCuttingState extends ScreenInfo {
  const FinishWithCuttingState({required BuildContext context, required void Function() onFinished, required void Function() onTerminated})
      : super(context: context, onFinished: onFinished, onTerminated: onTerminated);

  @override
  Widget getTopWidget() {
    return IndicateText();
  }

  @override
  Widget getMiddleWidget() {
    return IndicateImage();
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
              text: '이제 가위로 자르고\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '맛있게 드세요!\n',
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
  const IndicateImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/grillSettings/beef_well_done.png'),
      width: 250,
      height: 250,
    );
  }
}