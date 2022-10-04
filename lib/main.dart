import 'package:flutter/material.dart';
// 홈페이지 다트파일 임포트
import 'package:firtst/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //테마 컬러 설정
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 해당 위젯을 여기다 사용
      home: HomePage(),
    );
  }
}