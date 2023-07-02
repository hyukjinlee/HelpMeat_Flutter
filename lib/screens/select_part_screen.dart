import 'package:flutter/material.dart';
import 'package:helpmeat/resources/resources.dart';
import 'package:helpmeat/widgets/grill_meat_widget.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'package:helpmeat/navigators/navigator.dart';

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
          image: AssetImage(ResourceUtils.getMeatPartImagePath(
              meatInfoList[selectedItem].meatPartType)),
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
            return getListViewItem(index == selectedItem, index);
          },
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
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
          onPressed: () {
            widget.args.meatInfoDetail = meatInfoList[selectedItem];
            AppNavigator.push(context, Screens.SELECT_THICKNESS_SCREEN, widget.args);
          },
        ),
      ),
    ));
  }

  Widget getListViewItem(bool isSelected, int index) {
    Widget item;
    Color textColor;

    if (isSelected) {
      textColor = AppThemes.mainPink;
    } else {
      textColor = AppThemes.mainPink_40;
    }
    item = Center(
      child: Text(meatInfoList[index].name,
          style: TextStyle(color: textColor, fontSize: 40),
          textAlign: TextAlign.center),
    );

    if (isSelected) {
      item = Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppThemes.mainPink, width: 5),
            borderRadius: BorderRadius.all(AppThemes.radius)),
        child: item,
      );
    }
    return item;
  }
}
