import 'package:flutter/material.dart';
import 'screens/home.dart';
// screens의 home.dart 파일의 기능을 가져올 수 있다.


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'MeMo MeMo'), // screens에서 가져와야 한다.
    );
  }
}

