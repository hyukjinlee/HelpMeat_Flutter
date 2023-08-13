import 'package:flutter/material.dart';
import 'package:helpmeat/screens/grillProcess/state/screen_info.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

class TurnOverState extends ScreenInfo {
  const TurnOverState({required BuildContext context, required void Function() onFinished})
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
    return AppTextButton(onPressed: onFinished, text: '뒤집었다면 터치',);
  }
}

class IndicateText extends StatelessWidget {
  const IndicateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = TextStyle(fontSize: 15, color: AppThemes.mainPink);
    TextStyle bigTextStyle = TextStyle(fontSize: 50, color: AppThemes.mainPink);

    return Text.rich(
      TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '"앗 뜨뜨!"\n',
              style: smallTextStyle,
            ),
            TextSpan(
              text: '뒤집어 주세요\n',
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
      width: 250,
      height: 250,
    );
  }
}