import 'package:flutter/material.dart';

abstract class ScreenInfo {
  Widget getTopWidget();

  Widget getMiddleWidget();

  Widget getBottomWidget();
}