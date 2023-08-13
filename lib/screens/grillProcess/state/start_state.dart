import 'package:flutter/material.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

class StartState extends ScreenInfo {
  const StartState({required BuildContext context, required void Function() onFinished})
      : super(context: context, onFinished: onFinished);

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
    return AppTextButton(onPressed: onFinished, text: '고기를 올렸다면 터치',);
  }
}

class IndicateText extends StatelessWidget {
  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = TextStyle(fontSize: 20, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 35, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '고기를 올렸을 때\n',
              style: smallTextStyle,
            ),
            TextSpan(
              text: '치  -  이  -  익\n',
              style: bigTextStyle,
            ),
            TextSpan(
              text: '소리가 났나요?',
              style: bigTextStyle,
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
      image: AssetImage('assets/beef_well_done.png'),
      width: 150,
      height: 150,
    );
  }
}