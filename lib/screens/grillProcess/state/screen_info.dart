import 'package:flutter/material.dart';

abstract class ScreenInfo {
  final BuildContext context;
  final void Function() onFinished;
  final void Function()? onTerminated;

  const ScreenInfo({required this.context, required this.onFinished, this.onTerminated});

  Widget getTopWidget();

  Widget getMiddleWidget();

  Widget getBottomWidget();
}