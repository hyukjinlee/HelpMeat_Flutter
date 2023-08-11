import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';

/// 굽기 진행 페이지
class ProceedGrillingPage extends StatefulWidget {
  final GrillSettingsArguments args;

  ProceedGrillingPage({Key? key, required this.args}) : super(key: key);

  @override
  State<ProceedGrillingPage> createState() => _ProceedGrillingPageState();
}

class _ProceedGrillingPageState extends State<ProceedGrillingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(),
      ),
    );
  }
}