import 'package:f7/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginCheck(),
  ));
}

class LoginCheck extends StatefulWidget {
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  bool a = true;

  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@@@@@@@@@@ 부모 State");
    return a? new loginPage() : Scaffold(appBar: AppBar(),);
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "키즈코스",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange[300],
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.vpn_key),
              tooltip: "로그아웃",
              onPressed: () => {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => loginPage()),
                        (route) => false)
                  })
        ],
      ),
      drawer: Drawer(),
    );
  }
}
