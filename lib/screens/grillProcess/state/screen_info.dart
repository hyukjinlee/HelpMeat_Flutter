import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';

abstract class ScreenInfo {
  final BuildContext context;
  final GrillSettingsArguments args;
  final void Function() onFinished;
  final void Function()? onTerminated;

  const ScreenInfo({required this.context, required this.args, required this.onFinished, this.onTerminated});

  Widget getTopWidget();

  Widget getMiddleWidget();

  Widget getBottomWidget();
}