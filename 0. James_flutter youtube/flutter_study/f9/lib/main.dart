import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: LoginCheck()));
}

class LoginCheck extends StatefulWidget {
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  SharedPreferences _pref;
  bool _check;

  @override
  void initState() {
    Future.microtask(() async {
      _pref = await SharedPreferences.getInstance();
      setState(() {
        _check = _pref.getBool("login") ?? false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    if (_check == null) return LodigPage();
//    if (!_check) return AutoLogin();
//    return MainPage(superState: setState);
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, AsyncSnapshot<SharedPreferences> snap){
        if(!snap.hasData) return LodigPage();
        else{
          if(!(snap.data.get("login") ?? false)) return new AutoLogin(superState: setState);
          return new MainPage(superState: setState);
        }
      },
    );
  }
}

class LodigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

class AutoLogin extends StatefulWidget {
  Function superState;

  AutoLogin({@required this.superState});
  @override
  _AutoLoginState createState() => _AutoLoginState();
}

class _AutoLoginState extends State<AutoLogin> {
  final _url = "http://172.30.1.45:3000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Login"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("로그인"),
          onPressed: () async {
            // 서버가 체크해야할 것들
            // 계정, 패스워드      **
            // IP .. 초당 / 횟수
            // user-agent : 서버가 지정한 클라이언트가 아닐 수도 있기에
            // content-type - from - json / text-plan / base64
            // en / de xxx-urlencode
            // location
            // time
            // custom token = Header - OpenAPI ... session
            // MAC + @

            // 자동로그인 --
            // 로그인을 한적 있는지?
            // token -- 유효한 토큰인지?
            // ref(리플레이스) token -- 있는지?

            // 자동로그인 체크
            // 자동로그인이 있는지?
            // 있으면? 토큰이 있는지?
            // 있으면? 토큰이랑 서버랑 맞는지?
            // 맞으면 저장
            // 화면 재구성
            http.Response _res = await http.post(
              _url + '/login',
              headers: {"Content-Type": "application/json", "custom": 'custom'},
              body: json.encode({'id': 'id', 'pw': 'pw'}),
            );
            Map<String, dynamic> check = json.decode(_res.body);
            // 로그인을 했다
            // 체크의 토큰
            // 아이디와 비밀번호가 맞다 틀리다 분기

            // 맞으면
            // Future 이기에 비동기적으로 처리
            SharedPreferences _pref = await SharedPreferences.getInstance();
            _pref.getBool("login"); // null
            bool _saveCheck =
                await _pref.setBool("login", true); // { "login" : true }
            if (!_saveCheck)
              return; // 다시 시도하라는 return : 알림창이 떠야함 -> 시스템에 저장이 되는 경우
            /*_pref.getBool("login"); // true*/
            // id와 token을 저장
            widget.superState((){});
          },
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  Function superState;

  MainPage({@required this.superState});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("테스트페이지"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.vpn_key),
            onPressed: () async {
              SharedPreferences _pref = await SharedPreferences.getInstance();
              bool check = await _pref.clear();
              // if(check);
              widget.superState(() {});
              // _pref.setBool("login", false);
            },
          )
        ],
      ),
    );
  }
}
