import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids_course/data/join_or_login.dart';
import 'package:kids_course/screens_login/login.dart';
import 'package:kids_course/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:kids_course/test.dart';

void main() => runApp(MyApp(
));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 리본 제거
      home: Test(),
    );
  }
}

// Splash : 보통 첫 앱을 시작하면 log 를 보여준다.
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if(snapshot.data == null) { // snapshot : 로그인 데이터, 로그인이 안되어있을 경우
          return ChangeNotifierProvider<JoinOrLogin>.value( // 사용한다고만 알리는 역할
              value: JoinOrLogin(), // 오브젝트를 생성하여 전달
              child: AuthPage());
        }else{
          return MainPage(email: snapshot.data.email);
          // 해당 이메일로 로그인이 되있으면 MainPage() 로 이동
        }
      }
    );
  }
}

