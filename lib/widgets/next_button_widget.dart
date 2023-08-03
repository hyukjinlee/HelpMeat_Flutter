import 'package:flutter/material.dart';
import 'package:helpmeat/utils/resources.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: AppThemes.mainPink,
            minimumSize: Size(double.infinity, double.infinity)),
        onPressed: onPressed,
        child: Text("다음", style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
