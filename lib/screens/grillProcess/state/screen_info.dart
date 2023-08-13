import 'package:flutter/material.dart';

abstract class ScreenInfo {
  final BuildContext context;
  final void Function() onFinished;

  const ScreenInfo({required this.context, required this.onFinished});

  Widget getTopWidget();

  Widget getMiddleWidget();

  Widget getBottomWidget();
}