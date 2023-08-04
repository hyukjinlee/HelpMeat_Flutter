import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/widgets/grill_settings_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [5] 불 선택 화면 : 숯불 / 연탄 / 인덕션 / 가스레인지
class SelectFireScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  SelectFireScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectFireScreen> createState() => _SelectFireScreenState();
}

class _SelectFireScreenState extends State<SelectFireScreen> {
  List<FireInfo> fireInfoList = [];
  int selectedItem = 0;

  void initResources() {
    if (fireInfoList.isEmpty) {
      fireInfoList = ResourceUtils.getFireInfoList();
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
        elementList: fireInfoList,
        selectedItem: selectedItem,
        onSelectedItemChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
      ),
      bottom: NextButton(
        onPressed: () {
          widget.args.fireInfo = fireInfoList[selectedItem];
          AppNavigator.push(context, Screens.SELECT_GRIDDLE_SCREEN, widget.args);
        },
      ),
    ));
  }

  String getIndicateText() {
    return '어디에서 구울 건가요?';
  }

  String getIndicateImagePath() {
    return fireInfoList[selectedItem].imagePath;
  }
}
