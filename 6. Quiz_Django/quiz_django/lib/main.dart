import 'package:flutter/material.dart';
import 'package:quizdjango/screen/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Quiz App',
      home: HomeScreen(),
      );
  }
}
