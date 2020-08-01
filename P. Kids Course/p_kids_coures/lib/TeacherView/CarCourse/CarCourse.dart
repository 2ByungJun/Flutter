import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:http/http.dart' as http;

class CarCourseView extends StatefulWidget {
  @override
  _CarCourseViewState createState() => _CarCourseViewState();
}

class _CarCourseViewState extends State<CarCourseView> {
  var _isCheck = false; // 등&하원 스위치
  String adressValue = "주소를 검색해주세요"; // kopo 사용

  final _url = "http://192.168.0.130:3000";

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

    super.initState();
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
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(
                                width: 5, color: Colors.orange[200])),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snap.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(32.0),
                                            child: Text(
                                              'This is the modal bottom sheet. Slide down to dismiss.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Theme.of(context).accentColor,
                                                fontSize: 24.0,
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },

                                child: Card(
                                  child: ListTile(
                                      onTap: () {},
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
                                      title: Text(snap.data[index]['fields']['Name']),
                                      subtitle: Text("sub..."),
                                      trailing: Icon(Icons.clear)
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "주소지를 등록하시고 아이들의 차량지도를 관리하세요!",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                          Text(
                            "주소지를 클릭하시면 아이들을 추가할 수 있습니다!",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                        ],
                      ))
                ],
              ),
            );
          }),

      /***** 주소지 추가 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var result = await Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => Kopo(),
            ),
          );
          print(result.toJson());
          if (result != null) {
            setState(() {
              this.adressValue = '${result.address}';
            });
          }
        },
        label: Text(
          "주소지 추가",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.map),
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}
