import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginView/loginView.dart';

void main() => runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Work>(create: (_) => new Work()),
    ],
    child: MaterialApp(
      home: LoginView(),
    ),
  ));


/*class LoginCheck extends StatelessWidget {
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
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            ),
          );

        // snap.data가 false인 경우
        if (!snap.data) return LoginView();

        // snap.data가 true인 경우
        return SideBarLayout();
      },
    );
  }
}*/

class Work with ChangeNotifier {
  bool value = true;
  get url => "http://192.168.123.104:3000";

  Future<bool> check() async {
    return this.value;
  }

  Future<void> action() async {
    value = !value;
    notifyListeners();
    return;
  }
}