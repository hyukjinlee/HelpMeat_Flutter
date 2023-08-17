import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpmeat/methodChannels/method_channel_constants.dart';
import 'package:helpmeat/methodChannels/notification_channel.dart';
import 'package:helpmeat/navigators/navigator.dart';

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

class _HomeScreenState extends State<HomeScreen> {
  final MethodChannel _channel = MethodChannel(AppMethodChannelConstants.METHOD_CHANNEL_ID);
  var _text = "";

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
          mainAxisAlignment: MainAxisAlignment.center, // 자식들은 가운데 정렬
          children: <Widget>[
            ElevatedButton(
              child: Text('고기 굽기'),
              onPressed: () {
                AppNavigator.push(context, Screens.SELECT_MEAT_SCREEN, null);
              },
            ),
            ElevatedButton(
              child: Text('모름'),
              onPressed: () async {
                String result = await AppNotificationChannel.getPlatformVersion(_channel);
                setState(() {
                  _text = result;
                });
              },
            ),
            Text(_text),
          ],
        ),
      ),
    );
  }
}