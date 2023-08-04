import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_meat_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [2] 부위 선택 화면 : 등심/살치/안심 등..
class SelectPartScreen extends StatefulWidget {
  final GrillMeatArguments args;

  SelectPartScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectPartScreen> createState() => _SelectPartScreenState();
}

class _SelectPartScreenState extends State<SelectPartScreen> {
  List<MeatInfo> meatInfoList = <MeatInfo>[];
  int selectedItem = 0;

  void initResources() {
    if (meatInfoList.isEmpty) {
      meatInfoList = ResourceUtils.getMeatPartInfoList(widget.args.meatType);
    }
  }

  @override
  Widget build(BuildContext context) {
    initResources();

    return Scaffold(
        // appBar: AppBar(),
        body: GrillMeatLayout(
      top: Center(
        child: Image(
          image: AssetImage(meatInfoList[selectedItem].imagePath),
          width: 300,
          height: 300,
        ),
      ),
      middle: ListWheelScrollView.useDelegate(
        itemExtent: 60,
        diameterRatio: 2,
        squeeze: 0.7,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: meatInfoList.length,
          builder: (context, index) {
            return ListViewItem(isSelected: index == selectedItem, isKorean: true, text: meatInfoList[index].name,);
          },
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
      ),
      bottom: NextButton(
        onPressed: () {
          widget.args.meatPartType = meatInfoList[selectedItem].meatPartType;
          AppNavigator.push(context, Screens.SELECT_THICKNESS_SCREEN, widget.args);
        },
      ),
    ));
  }
}
