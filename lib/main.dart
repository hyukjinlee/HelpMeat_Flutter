import 'package:flutter/material.dart';
import 'package:helpmeat/navigators/navigator.dart';
import 'package:helpmeat/notification/notification.dart';
import 'package:helpmeat/utils/permission.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelpMeat', // 타이틀 설정
      home: HomeScreen(), // 첫번째 라우트로 HomeScreen 설정,
      theme: ThemeData(
        fontFamily: "MainFont"
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  // late Future<String> permissionStatusFuture;

  @override
  void initState() {
    NotificationManager.init();
    // NotificationManager.requestNotificationPermission();
    // Future.delayed(const Duration(seconds: 3), NotificationManager.requestNotificationPermission());

    super.initState();

    // permissionStatusFuture = getCheckNotificationPermStatus();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        // permissionStatusFuture = getCheckNotificationPermStatus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        // 가운데
        child: Column(
          // 컬룸 추가
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('고기 굽기'),
              onPressed: () {
                AppNavigator.push(context, Screens.SELECT_MEAT_SCREEN, null);
              },
            ),
            ElevatedButton(
              onPressed: () {
                PermissionUtils.requestNotificationPermission(() {
                  // permissionStatusFuture = getCheckNotificationPermStatus();
                });
              },
              child: Text('알림 권한 주기'),
            )
          ],
        ),
      ),
    );
  }
}