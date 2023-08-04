import 'package:flutter/material.dart';
import 'package:helpmeat/utils/resources.dart';

class GrillSettingsLayout extends StatelessWidget {
  final Widget top;
  final Widget middle;
  final Widget bottom;

  const GrillSettingsLayout(
      {Key? key,
      required this.top,
      required this.middle,
      required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemes.screenBackGround,
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: top,
          ),
          Flexible(
            flex: 4,
            child: Material(
              borderRadius: BorderRadius.all(AppThemes.radius),
              elevation: 6.0,
              color: Colors.white,
              child: middle,
            ),
          ),
          Flexible(
              flex: 1,
              child: bottom)
        ],
      ),
    );
  }
}