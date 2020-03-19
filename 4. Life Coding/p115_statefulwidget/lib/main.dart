import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _text = 'Hello';

  void _changeText(){
    setState(() {
      _text = 'World!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('p115 StatefulWidget 실습'),
      ),
      body: Text(_text,
        style: TextStyle(fontSize: 40),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeText,
        tooltip: 'change Text',
        child: Icon(Icons.touch_app),
        backgroundColor: Colors.green,
      ),
    );
  }
}
