import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_meat_arguments.dart';
import 'package:helpmeat/screens/select_meat_screen.dart';
import 'package:helpmeat/screens/select_part_screen.dart';
import 'package:helpmeat/screens/select_thickness_screen.dart';


class AppNavigator {
  static void push(BuildContext context, Screens screen, Arguments? arguments) {
    WidgetBuilder builder;

    switch (screen) {
      case Screens.SELECT_MEAT_SCREEN:
        builder = (context) => SelectMeatScreen();
        break;
      case Screens.SELECT_PART_SCREEN:
        builder = (context) => SelectPartScreen(args: arguments as GrillMeatArguments);
        break;
      case Screens.SELECT_THICKNESS_SCREEN:
        builder = (context) => SelectThicknessScreen(args: arguments as GrillMeatArguments);
        break;
      default:
        return;
    }

    Navigator.push(context, SlideTransitionRoute(builder: builder));
  }
}

/// 페이지 전환 시, Slide Transition 과 함께 전환될 수 있게 하는 Class
class SlideTransitionRoute<T> extends MaterialPageRoute<T> {
  SlideTransitionRoute(
      {required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child);
  }
}

enum Screens {
  SELECT_MEAT_SCREEN,
  SELECT_PART_SCREEN,
  SELECT_THICKNESS_SCREEN,
}