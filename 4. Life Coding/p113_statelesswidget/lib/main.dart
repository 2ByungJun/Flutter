import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 1. StatelessWidget 한 클래스로 표현
/**
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget 실습'),
        ),
        body: Text('Hello World!', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
**/

// 2. StatelessWidget 두 클래스로 표현
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidget 두 클래스 실습'),
      ),
      body: Text('Hello World!', style: TextStyle(fontSize: 40,color: Colors.red) // 변화를 주기위해 빨간 글씨
      ),
    );
  }
}
