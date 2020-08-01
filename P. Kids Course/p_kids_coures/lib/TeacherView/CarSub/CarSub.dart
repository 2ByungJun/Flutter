import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarSubView extends StatefulWidget{
  @override
  _CarSubViewState createState() => _CarSubViewState();
}

class _CarSubViewState extends State<CarSubView> {
  final _url = "http://192.168.0.130:3000";

  var _isCheck = false; // 등&하원 스위치
  var i=0;

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/course");
    List<dynamic> _resBody = json.decode(_res.body);
    return _resBody;
  }

  @override
  void initState() {
    Future.microtask(() async {
      List result = await this.fetch();
      setState(() {});
      print(result);
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.fetch(),
          builder: (BuildContext context, AsyncSnapshot<List> snap) {
            if (!snap.hasData) return CircularProgressIndicator();

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  /***** 등&하원 스위치 *****/
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "등원",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange),
                        ),
                        Switch(
                          value: _isCheck,
                          onChanged: (value) {
                            setState(() {
                              _isCheck = value;
                            });
                          },
                        ),
                        Text(
                          "하원",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.indigo),
                        )
                      ],
                    ),
                  ),

                  /***** 주소지 ListView *****/
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 380.0,
                        padding: const EdgeInsets.all(3.0),
                        child: ListView.builder(
                          reverse: _isCheck,
                          scrollDirection: Axis.vertical,
                          itemCount: snap.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                if(_isCheck)
                                  Icon(Icons.keyboard_arrow_up, color: Colors.indigo,size: 30,),

                                Card(
                                  child: ListTile(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                height: 120,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("주소 : " +  snap.data[index]['fields']['Name'],
                                                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                                    ),

                                                    RaisedButton(
                                                      onPressed: () {},
                                                      child: Text("도착 처리",
                                                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                                                      ),
                                                      color: Colors.purple[300],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      onLongPress: null,
                                      leading: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        child: ClipOval(
                                          child: Image.asset(
                                              "images/logo.gif",
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      title: Text(snap.data[index]
                                      ['fields']['Name']),
                                      subtitle: Text(snap.data[index]
                                      ['fields']['Address']),
                                      trailing: Icon(Icons.clear)),
                                ),

                                if(!_isCheck)
                                 Icon(Icons.keyboard_arrow_down, color: Colors.deepOrangeAccent, size: 30,),
                              ],
                            );
                          },
                        )),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("5분 전에 도착 주소지 도착버튼을 클릭하세요!",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[400]),),

                          Text("부모님께 알림메세지가 도착하게 됩니다.",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
                        ],
                      )
                  )
                ],
              ),
            );
          }),
    );
  }
}