import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';
import 'package:helpmeat/utils/util.dart';
import 'package:helpmeat/widgets/grill_settings_widget.dart';
import 'package:helpmeat/widgets/ui_widget.dart';

/// [3] 두께 선택 화면 : 0.1 ~ 5.0 cm
class SelectThicknessScreen extends StatefulWidget {
  final GrillSettingsArguments args;

  SelectThicknessScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<SelectThicknessScreen> createState() => _SelectThicknessScreenState();
}

class _SelectThicknessScreenState extends State<SelectThicknessScreen> {
  Offset _position = Offset(0.0, 110.0);
  final GlobalKey _contentsBoxKey = GlobalKey();
  final GlobalKey _rulerKey = GlobalKey();

  Rect _rulerRect = Rect.zero;
  double _yDeltaFor1mm = 0;
  double _thickness = 0;

  @override
  Widget build(BuildContext context) {
    String thicknessText;
    if (_thickness >= 0.1) {
      thicknessText = '${_thickness}cm';
    } else {
      thicknessText = '';
    }

    double signWidth = 100.0;
    double signHeight = 50.0;

    return Scaffold(
        // appBar: AppBar(),
        body: GrillSettingsLayout(
      top: IndicateText(thickness: _thickness,),
      middle: Row(
        key: _contentsBoxKey,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: signWidth,
            height: double.infinity,
            child: Stack(
              children: [
                GestureDetector(
                  child: Stack(
                    children: [
                      Positioned(
                        top: _position.dy,
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage('assets/horizontal_sign.png'),
                              width: signWidth,
                              height: signHeight,
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    style: TextStyle(fontSize: 25, color: Colors.white),
                                    thicknessText,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  onPanStart: (details) => {
                    if (_rulerRect == Rect.zero) {
                      initBoundary(details.localPosition, signHeight)
                    }
                  },
                  onPanUpdate: (details) => {
                    setState(() {
                      double signPositionY = details.localPosition.dy + (signHeight / 2);
                      if (_position != details.localPosition &&
                          signPositionY >= _rulerRect.top && signPositionY <= _rulerRect.bottom) {
                        _position = details.localPosition;
                        _thickness = ((signPositionY - _rulerRect.top) / _yDeltaFor1mm).round() / 10.0; // mm to cm

                        if (_thickness == 0) {
                          _thickness = 0.1;
                        }
                        print('_thickness : $_thickness');
                      }
                    })
                  },
                ),
                HelpText()
              ],
            ),
          ),
          Image(
            key: _rulerKey,
            image: AssetImage('assets/ruler.png'),
            width: 90,
            height: 280,
          ),
        ],
      ),
      bottom: NextButton(
        onPressed: () {
          if (_thickness >= 0.1) {
            widget.args.thickness = _thickness;
            AppNavigator.push(context, Screens.SELECT_DONENESS_SCREEN, widget.args);
          }
        },
      ),
    ));
  }

  void initBoundary(Offset signOffset, double signHeight) {
    _rulerRect = Utils.getWidgetLocalRect(_rulerKey, _contentsBoxKey);
    _yDeltaFor1mm = _rulerRect.height / 50.0;
  }
}

class IndicateText extends StatelessWidget {
  final double thickness;

  const IndicateText({Key? key, required this.thickness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstText = ResourceUtils.getFirstStringByMeatThickness(thickness);
    String centerText = ResourceUtils.getCenterStringByMeatThickness(thickness);
    String lastText = ResourceUtils.getLastStringByMeatThickness(thickness);

    List<Widget> textViewList = [];
    addTextWidgetToList(textViewList, firstText, 25);
    if (centerText.isNotEmpty) {
      addTextWidgetToList(textViewList, centerText, 45);
    }
    addTextWidgetToList(textViewList, lastText, 25);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: textViewList,
    );
  }

  void addTextWidgetToList(List<Widget> list, String text, double fontSize) {
    list.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        style: TextStyle(fontSize: fontSize),
        text,
      ),
    ));
  }
}


class HelpText extends StatelessWidget {
  const HelpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                style: TextStyle(fontSize: 25, color: AppThemes.mainPink_40),
                '위/아래로',
              ),
              Text(
                style: TextStyle(fontSize: 25, color: AppThemes.mainPink_40),
                '이동!',
              )
            ],
          ),
        ),
      ),
    );
  }
}

