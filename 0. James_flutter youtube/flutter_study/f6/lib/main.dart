import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _url = "http://172.30.1.59:5000";
  IO.Socket socket;

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/air");
    List<dynamic> _resBody = json.decode(_res.body);
    print(_resBody);
    return _resBody;
  }

  Future<bool> createFetch({@required String name, @required int age}) async{

  }

  @override
  void initState() {
    if (!mounted) return;
    Future.microtask(() async {
      List result = await this.fetch();
      setState(() {});
      print(result);
      return;
    }).then((_) async {
      socket = IO.io(
          _url,
          <String, dynamic>{
            'transports': ['websocket'], // 순수 소켓을 쓰겠다.
            'autoConnect': false, // 소켓은 계속 연결은 시도하게 한다.
          }
      )
        ..connect();

      /** 받는 경우 **/
      socket.on("check", (data) => print(data));
      /** JSON 형태로 파싱을 안해도 JSON 형태로 온다. **/
      socket.on("name", (data) => print(data));
      socket.on("age", (data) => print(data));
      socket.on("select", (data) => print(data));
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Airtable 실습"),
        ),
        body: FutureBuilder(
          future: this.fetch(),
          builder: (BuildContext context, AsyncSnapshot<List> snap) {
            if (!snap.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      socket.emit("select", snap.data[index]['id']);
                      setState(() {});
                    },
                    leading: Icon(Icons.access_time),
                    title: Text(snap.data[index]['fields']['Name'].toString()),
                    subtitle: Text(snap.data[index]['fields']['Age'].toString()),
                  );
                });
          },
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>{
          socket.emit("name", "생성됨2"),
          socket.emit("age", "222"),
          setState(() {})
        },
      ),
    );
  }
}
//
//class Create extends StatefulWidget {
//  @override
//  _CreateState createState() => _CreateState();
//}
//
//class _CreateState extends State<Create> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("생성"),
//      ),
//
//      body: Column(
//        children: <Widget>[
//
//        ],
//      )
//    );
//  }
//}
