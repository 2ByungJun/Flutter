import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      // 여러개이니 리스트형식
      providers: [
        // (_) : 암묵적 룰 : BuildContext 를 안쓰겠다
        ChangeNotifierProvider<Work>(create: (_) => new Work()),
      ],
      child: MaterialApp(
        home: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  // build
  // 1. 프로그레스 화면
  // 2. 성공 화면
  // 3. 실패 화면
  Widget build(BuildContext context) {
    // Provider 은 build 아래에서
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
        if (!snap.data) return LoginPage();

        // snap.data가 true인 경우
        return MainPage();
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
        body: Center(
          child: Text(_work.value.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () async {
            await _work.action();
            return;
          },
        ));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      body: Center(
        child: Text("TRUE!!"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () async {
          await _work.action();
          return;
        },
      ),
    );
  }
}


// ChangeNotifier : 문법적인 요소
// with : mixIn
class Work with ChangeNotifier {
  bool value = true;

  // Future + async
  Future<bool> check() async {
    // alt + shift : 방향키이동
    // 1. Local DB를 찾아야함
    // 2. 네트워크 연결 : Future
    // 3. 결과 반환

    return this.value;
  }

  Future<void> action() async {
    value = !value;
    // setState()의 기능
    notifyListeners();
    return;
  }
}
