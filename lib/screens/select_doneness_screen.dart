import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_meat_widget.dart';
import 'package:helpmeat/widgets/next_button_widget.dart';

/// [4] 굽기 정도 선택 화면 : RARE / MEDIUM / WELL DONE 등..
class SelectDonenessScreen extends StatefulWidget {
  final GrillMeatArguments args;

  SelectDonenessScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectDonenessScreen> createState() => _SelectDonenessScreenState();
}

class _SelectDonenessScreenState extends State<SelectDonenessScreen> {
  List<MeatInfo> meatInfoList = <MeatInfo>[];
  int selectedItem = 0;

  void initResources() {
    if (meatInfoList.isEmpty) {
      meatInfoList = ResourceUtils.getMeatPartInfoList(widget.args.meatType);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('고기 : ${widget.args.meatType}, 부위 : ${widget.args.meatInfoDetail?.name} (${widget.args.meatInfoDetail?.meatPartType}), 두께 : ${widget.args.thickness}');
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
      bottom: NextButton(
        onPressed: () {

        },
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
