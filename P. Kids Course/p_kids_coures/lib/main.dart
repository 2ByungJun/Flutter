import 'package:flutter/material.dart';
import 'LoginView/loginView.dart';

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
    return a? new LoginView() : Scaffold(appBar: AppBar(),);
  }
}