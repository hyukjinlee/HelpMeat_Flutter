import 'package:flutter/material.dart';
import 'package:helpmeat/resources/resources.dart';
import 'package:helpmeat/widgets/grill_meat_widget.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'dart:math' as math;

import 'package:scroll_to_index/scroll_to_index.dart';

/// [3] 두께 선택 화면 : 0.5 ~ 4.5 cm
class SelectThicknessScreen extends StatelessWidget {
  final GrillMeatArguments args;

  SelectThicknessScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('고기 : ${args.meatType}, 부위 : ${args.meatInfoDetail?.name} (${args.meatInfoDetail?.meatPartType})');

    double degrees = 270;
    double radius = degrees * math.pi / 180;

    return Scaffold(
      // appBar: AppBar(),
        body: GrillMeatLayout(
          top: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    style: TextStyle(fontSize: 25),
                    '이제 두께(\u21D5)를 측정',
                  ),
                  Text(
                    style: TextStyle(fontSize: 25),
                    '해주세요',
                  )
                ],
              ),
              Image(
                image: AssetImage('assets/beef_rare.png'),
                width: 150,
                height: 150,
              ),
            ],
          ),
          middle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform.rotate(angle: radius,child: Ruler(),)
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
}

class Ruler extends StatefulWidget {
  const Ruler({Key? key}) : super(key: key);

  @override
  State<Ruler> createState() => _RulerState();
}

class _RulerState extends State<Ruler> {
  double _counter = 0.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
            tickMarkShape: SliderTickMarkShape.noTickMark,
            trackHeight: 12,
            inactiveTrackColor: Colors.amber[200],
            activeTrackColor: Colors.amber,
            thumbColor: Colors.white,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10)),
        child: Stack(
          children: [
            showTrack(),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Slider(
                value: _counter,
                min: 0,
                max: 5,
                divisions: 5,
                onChanged: (value) {
                  setState(() {
                    _counter = value;
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget showTrack(){
    return Padding(padding: const EdgeInsets.fromLTRB(23, 23, 23, 23),
      child: Row(
        children: [
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
          const Spacer(),
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
          const Spacer(),
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
          const Spacer(),
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
          const Spacer(),
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
          const Spacer(),
          Container( height:6.0, width:2.0, color:Colors.blueGrey,),
        ],
      ),);
  }
}
