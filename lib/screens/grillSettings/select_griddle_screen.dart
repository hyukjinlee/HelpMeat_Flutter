import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_settings_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [6] 불판 선택 화면 : 솥뚜껑 / 코팅 불판 / 프라이팬 / 석쇠
class SelectGriddleScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  SelectGriddleScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectGriddleScreen> createState() => _SelectGriddleScreenState();
}

class _SelectGriddleScreenState extends State<SelectGriddleScreen> {
  List<GriddleInfo> griddleInfoList = [];
  int selectedItem = 0;

  void initResources() {
    if (griddleInfoList.isEmpty) {
      griddleInfoList = ResourceUtils.getGriddleInfoList(widget.args.fireInfo!.fireType);
    }
  }

  @override
  Widget build(BuildContext context) {
    initResources();

    return Scaffold(
        // appBar: AppBar(),
        body: GrillSettingsLayout(
      top: VerticalTextImageUI(
        text: getIndicateText(),
        imagePath: getIndicateImagePath(),
      ),
      middle: GrillSettingsListView(
        isKorean: true,
        elementList: griddleInfoList,
        selectedItem: selectedItem,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
      ),
      bottom: AppTextButton(
        onPressed: () {
          widget.args.griddleInfo = griddleInfoList[selectedItem];
          AppNavigator.push(context, Screens.FINISH_SETTINGS_SCREEN, widget.args);
        },
      ),
    ));
  }

  String getIndicateText() {
    return '무엇으로 구울 건가요?';
  }

  String getIndicateImagePath() {
    return griddleInfoList[selectedItem].imagePath;
  }
}
