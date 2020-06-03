import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11. Navigator Tutorial-page(1)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("페이지 이동"),
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PageTwo()
                )
            );
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11. Navigator Tutorial-page(2)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("뒤로 돌기"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}