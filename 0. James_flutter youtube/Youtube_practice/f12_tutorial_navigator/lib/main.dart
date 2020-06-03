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
        title: Text("12. Navigator Tutorial-Data(push)"),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Data: Value"),
            ),
            RaisedButton(
              child: Text("페이지 이동"),
              onPressed: () async {
                String backValue = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageTwo(data:"Value")
                  ),
                );
                print(backValue);
              },
            ),
          ],
        ),
      ),
     );
  }
}

class PageTwo extends StatefulWidget {

  String data;
  PageTwo({@required this.data});

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12. Navigator Tutorial-Data(pop)"),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(widget.data.toString()),
            ),
            RaisedButton(
              child: Text("뒤로 돌기"),
              onPressed: (){
                Navigator.of(context).pop("Back Value");
              },
            ),
          ],
        ),
      ),
    );
  }
}

