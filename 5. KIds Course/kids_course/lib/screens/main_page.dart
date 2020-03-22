import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  MainPage({this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
      ),
      body: Container(
        child: Center(
          child: FlatButton(onPressed: (){
              }, child: Text("Logout")),
        ),
      ),
    );
  }
}
