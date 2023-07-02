import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
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
            // 첫번째 자식. 파라미터를 명시적으로 전달하는 방식으로 라우트 호출
            ElevatedButton(
              child: Text('고기 굽기'),
              onPressed: () {
                AppNavigator.push(context, Screens.SELECT_MEAT_SCREEN, null);
              },
            ),

            // 두번째 자식
            ElevatedButton(
              child: Text('모름'),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}