import 'package:flutter/material.dart';
import 'package:helpmeat/resources/resources.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'package:helpmeat/widgets/grill_meat_widget.dart';

/// [3] 두께 선택 화면 : 0.1 ~ 5.0 cm
class SelectThicknessScreen extends StatelessWidget {
  final GrillMeatArguments args;

  SelectThicknessScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('고기 : ${args.meatType}, 부위 : ${args.meatInfoDetail?.name} (${args.meatInfoDetail?.meatPartType})');

    String firstText = ResourceUtils.getFirstStringByMeatThickness(0.0);
    String centerText = ResourceUtils.getCenterStringByMeatThickness(0.0);
    String lastText = ResourceUtils.getLastStringByMeatThickness(0.0);

    List<Widget> textViewList = [];
    addTextWidgetToList(textViewList, firstText, 25);
    if (centerText.isNotEmpty) {
      addTextWidgetToList(textViewList,centerText, 35);
    }
    addTextWidgetToList(textViewList, lastText, 25);

    return Scaffold(
      // appBar: AppBar(),
        body: GrillMeatLayout(
          top: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: textViewList,
          ),
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("TO DO"),
              Image(
                image: AssetImage('assets/ruler.png'),
                width: 100,
                height: double.infinity,
              ),
            ],
          ),
          bottom: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: AppThemes.mainPink,
                  minimumSize: Size(double.infinity, double.infinity)),
              child: Text("다음",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              onPressed: () {},
            ),
          ),
        )
    );
  }

  void addTextWidgetToList(List<Widget> list, String text, double fontSize) {
    list.add(Text(
      style: TextStyle(fontSize: fontSize),
      text,
    ));
  }
}