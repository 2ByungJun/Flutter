import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyApp2 extends StatefulWidget {
  final List data;
  MyApp2(this.data);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: this.widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {},
              onLongPress: null,
              leading: Image.network(this.widget.data[index]['img'].toString()),
              title: Text(this.widget.data[index]['title'].toString()),
              subtitle: Text(this.widget.data[index]['des'].toString()),
              trailing: IgnorePointer(
                ignoring: true,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ));
        },
      ),
//    body: WebviewScaffold(
//      appBar: AppBar(title: Text("웹뷰 타이틀"),),
//      url: "http://172.30.1.33:3000/admin",
//    ),
    );
  }
}