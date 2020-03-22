import 'package:flutter/material.dart';
import 'package:kids_course/data/join_or_login.dart';
import 'package:kids_course/screens/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value( // 사용한다고만 알리는 역할
          value: JoinOrLogin(), // 오브젝트를 생성하여 전달
          child: AuthPage()),
    );
  }
}
 
