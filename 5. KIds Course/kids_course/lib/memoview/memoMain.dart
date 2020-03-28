import 'package:flutter/material.dart';
import 'package:kids_course/memoview/memoHome.dart';
// screens의 home.dart 파일의 기능을 가져올 수 있다.


void main() => runApp(memomain());

class memomain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange, primaryColor: Colors.white,
      ),
      home: MemoHomePage(title: '공지사항'), // screens에서 가져와야 한다.
    );
  }
}