import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class SocketPage extends StatefulWidget {
  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {

  IO.Socket socket;
  // on : 받을 때
  // emit : 보낼 때

  Future<List> fetch() async{
    http.Response _res;
    try {
      _res = await http.get("http://172.30.1.59:3000/air");
    }catch(e){
      _res = http.Response("[]", 404);
    }
    if(_res.statusCode != 200) return [];
    return json.decode(_res.body); // Model
  }

  @override
  void initState() {
    if(!mounted) return; // state의 속성이며, initState가 시작되면 작동
    Future.microtask(() async{
      List result = await fetch();
      print(result);
      return;
    }).then((_) async{
      socket = IO.io(
          "http://172.30.1.59:3000/",
          <String, dynamic>{
            'transports': ['websocket'], // 순수 소켓을 쓰겠다.
            'autoConnect': false, // 소켓은 계속 연결은 시도하게 한다.
          }
      )..connect();
      //socket.connect();

      /** 받는 경우 **/
      socket.on("check", (data) => print(data));
      /** JSON 형태로 파싱을 안해도 JSON 형태로 온다. **/
      socket.on("send", (data) => print(data[0]));
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
          /** 보냏 경우 **/
          socket.emit("send", "Flutter SEND");
        },
      ),
    );
  }
}
