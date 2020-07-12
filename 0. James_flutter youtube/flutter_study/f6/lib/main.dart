import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:vibration/vibration.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
  final _url = "http://192.168.123.102:5000";
  IO.Socket socket;

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/air");
    List<dynamic> _resBody = json.decode(_res.body);
    print(_resBody);
    return _resBody;
  }

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    _firebaseMessaging.getToken().then((c) {
      print(c);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    Future.microtask(() async {
      List result = await this.fetch();
      setState(() {});
      print(result);
      return;
    }).then((_) async {
      socket = IO.io(_url, <String, dynamic>{
        'transports': ['websocket'], // 순수 소켓을 쓰겠다.
        'autoConnect': false, // 소켓은 계속 연결은 시도하게 한다.
      })
        ..connect();

      /** 받는 경우 **/
      socket.on("check", (data) => print(data));
      /** JSON 형태로 파싱을 안해도 JSON 형태로 온다. **/
      socket.on("name", (data) => print(data));
      socket.on("age", (data) => print(data));
      socket.on("select", (data) => print(data));
      socket.on("update", (data) => print(data));
    });
    super.initState();
  }

  GlobalKey<ScaffoldState> k = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: k,
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
                    socket.emit("update", snap.data[index]['id']);
                    setState(() {});
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text("삭제하시겠어요?"),
                              content: Text("삭제하시려면 확인을 눌러주세요."),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("확인"),
                                  onPressed: () async {
                                    final http.Response _res = await http.post(
                                        '$_url/delete',
                                        body: {"data": snap.data[index]['id']});
                                    final bool _resultCheck = json.decode(_res.body);
                                    if (!_resultCheck) return;
//                                        socket.emit(
//                                            "select", snap.data[index]['id']);
                                    Navigator.pop(context, "확인");
                                    setState(() {});
                                  },
                                ),
                                FlatButton(
                                  child: Text("취소"),
                                  onPressed: () {
                                    Navigator.pop(context, "취소");
                                  },
                                )
                              ],
                            ));
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
        onPressed: () async {
//          socket.emit("name", "생성됨2"),
//          socket.emit("age", "222"),
          final http.Response _res =
              await http.post('$_url/create', body: {"data": "dddddd"});
          final bool _resultCheck = json.decode(_res.body);
          if (!_resultCheck) return;
          setState(() {});
          k.currentState.showSnackBar(SnackBar(
            content: Text("성공"),
          ));
          return;
        },
      ),
    );
  }
}
