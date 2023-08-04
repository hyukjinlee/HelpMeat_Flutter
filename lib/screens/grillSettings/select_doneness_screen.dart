import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_settings_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [4] 굽기 정도 선택 화면 : RARE / MEDIUM / WELL DONE 등..
class SelectDonenessScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  SelectDonenessScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectDonenessScreen> createState() => _SelectDonenessScreenState();
}

class _SelectDonenessScreenState extends State<SelectDonenessScreen> {
  List<DonenessInfo> donenessInfoList = <DonenessInfo>[];
  int selectedItem = 0;

  void initResources() {
    if (donenessInfoList.isEmpty) {
      donenessInfoList = ResourceUtils.getDonenessInfoList(widget.args.meatType);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('고기 : ${widget.args.meatType}, 부위 : ${widget.args.meatInfoDetail?.name} (${widget.args.meatInfoDetail?.meatPartType}), 두께 : ${widget.args.thickness}');
    initResources();

    return Scaffold(
        // appBar: AppBar(),
        body: GrillSettingsLayout(
      top: VerticalTextImageUI(
        textList: getIndicateTextList(),
        imagePath: getIndicateImagePath(),
      ),
      middle: GrillSettingsListView(
        isKorean: false,
        elementList: donenessInfoList,
        selectedItem: selectedItem,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
      ),
      bottom: NextButton(
        onPressed: () {
          widget.args.donenessType = donenessInfoList[selectedItem].donenessType;
          AppNavigator.push(context, Screens.SELECT_FIRE_SCREEN, widget.args);
        },
      ),
    ));
  }

  List<String> getIndicateTextList() {
    return [
      '원하는 굽기 정도를',
      '골라주세요'
    ];
  }

  String getIndicateImagePath() {
    return donenessInfoList[selectedItem].imagePath;
  }
}
