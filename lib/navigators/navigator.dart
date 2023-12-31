import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/screens/grillProcess/proceed_grilling_screen.dart';
import 'package:helpmeat/screens/grillSettings/finish_settings_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_doneness_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_fire_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_griddle_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_meat_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_part_screen.dart';
import 'package:helpmeat/screens/grillSettings/select_thickness_screen.dart';
import 'package:helpmeat/screens/history/grill_history_screen.dart';


class AppNavigator {
  static void push(BuildContext context, Screens screen, Arguments? arguments) {
    WidgetBuilder builder;

    switch (screen) {
      case Screens.SELECT_MEAT_SCREEN:
        builder = (context) => SelectMeatScreen();
        break;
      case Screens.SELECT_PART_SCREEN:
        builder = (context) => SelectPartScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.SELECT_THICKNESS_SCREEN:
        builder = (context) => SelectThicknessScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.SELECT_DONENESS_SCREEN:
        builder = (context) => SelectDonenessScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.SELECT_FIRE_SCREEN:
        builder = (context) => SelectFireScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.SELECT_GRIDDLE_SCREEN:
        builder = (context) => SelectGriddleScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.FINISH_SETTINGS_SCREEN:
        builder = (context) => FinishSettingsScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.PROCEED_GRILLING_SCREEN:
        builder = (context) => ProceedGrillingScreen(args: arguments as GrillSettingsArguments);
        break;
      case Screens.GRILL_HISTORY_SCREEN:
        builder = (context) => GrillHistoryScreen(args: arguments as GrillSettingsArguments);
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
  SELECT_DONENESS_SCREEN,
  SELECT_FIRE_SCREEN,
  SELECT_GRIDDLE_SCREEN,
  FINISH_SETTINGS_SCREEN,
  PROCEED_GRILLING_SCREEN,
  GRILL_HISTORY_SCREEN,
}