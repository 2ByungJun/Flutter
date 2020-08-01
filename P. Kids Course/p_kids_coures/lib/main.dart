import 'package:flutter/material.dart';
import 'package:pkidscoures/TeacherView/Attend/AttendView.dart';
import 'package:pkidscoures/TeacherView/PageManager.dart';
import 'package:provider/provider.dart';
import 'LoginView/loginView.dart';
import 'SideBar/sidebar_layout.dart';

void main() => runApp(MultiProvider(
    providers: [
      // (_) : 암묵적 룰 : BuildContext 를 안쓰겠다
      ChangeNotifierProvider<Work>(create: (_) => new Work()),
    ],
    child: MaterialApp(
      home: LoginCheck(),
    ),
  ));


class LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return FutureBuilder(
      future: _work.check(),
      builder: (BuildContext context, AsyncSnapshot<bool> snap) {
        // 입력 대기중 액션
        if (!snap.hasData)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          );

        // snap.data가 false인 경우
        if (!snap.data) return LoginView();

        // snap.data가 true인 경우
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SideBarLayout(),
        );
      },
    );
  }
}

class Work with ChangeNotifier {
  bool value = true;
  get url => "http://192.168.0.130:3000";

  Future<bool> check() async {
    return this.value;
  }

  Future<void> action() async {
    value = !value;
    notifyListeners();
    return;
  }
}