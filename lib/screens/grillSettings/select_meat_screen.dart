import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_settings_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [1] 고기 굽기 화면 : 돼지고기 / 소고기 선택
class SelectMeatScreen extends StatelessWidget {
  SelectMeatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 추출한 아규먼트로 Scaffold를 구성하여 반환
    return Scaffold(
        // appBar: AppBar(),
        body: GrillSettingsLayout(
      top: VerticalTextImageUI(
        text: getIndicateText(),
        imagePath: getIndicateImagePath(),
      ),
      middle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          TextImageButton(meatType: MeatType.MEAT_TYPE_FORK),
          Divider(
              color: AppThemes.screenBackGround,
              thickness: 1.0,
              height: 1.0,
              indent: 10.0,
              endIndent: 10.0),
          TextImageButton(meatType: MeatType.MEAT_TYPE_BEEF)
        ],
      ),
      bottom: SizedBox(),
    ));
  }

  String getIndicateText() {
    return '먼저, 고기를\n선택해주세요';
  }

  String getIndicateImagePath() {
    return 'assets/question_mark.png';
  }
}

class TextImageButton extends StatelessWidget {
  final MeatType meatType;

  const TextImageButton({Key? key, required this.meatType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(
            context, Screens.SELECT_PART_SCREEN, GrillSettingsArguments(meatType));
      },
      borderRadius: BorderRadius.all(AppThemes.radius),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ResourceUtils.getMeatImagePath(meatType)),
              width: 140,
              height: 140,
            ),
            Expanded(
              child: Text(
                style: TextStyle(color: AppThemes.mainPink, fontSize: 25),
                textAlign: TextAlign.center,
                ResourceUtils.getMeatText(meatType),
              ),
            )
          ],
        ),
      ),
    );
  }
}
