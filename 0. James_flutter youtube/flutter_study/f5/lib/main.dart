import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'myApp2.dart';
import 'myApp3.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Future -> 동기/비동기
  // 사용하기 위해선 Future를 사용해야한다.
  List value;
  Future<List> fetch() async {
    String _url = "http://192.168.0.19:3000/"; // _는 private
    http.Response _data = await http.get(_url); // "문자열" -- > 문자열 // RES
    return json.decode(_data.body);
  }

  @override
  void initState() {
    Future.microtask(() async {
      this.value = await this.fetch();
      setState(() {}); // 한번 꼭 돌려준다.
      print(value);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메인"),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150.0,
                color: Colors.green[200],
              ),
            ],
          ),
        ),
      ),
      body: this.value == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: this.value.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext bc, int index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(_createRoute(value[index]['data'])),
                  child: Card(
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.yellow,
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.more_horiz),
                          ),
                          Container(
                            //color: Colors.pink[200],
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                  return MyApp3(
                                      this.value[index]['img'].toString());
                                }));
                              },
                              child: Hero(
                                tag: this.value[index]['img'].toString(),
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          this.value[index]['img'].toString(),
                                        ),
                                        fit: BoxFit
                                            .cover // 가로와 높이에 따라 정비율로 늘려준다. , 높이만 fitHeight
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.purple[200],
                            padding: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ), // 자기자신을 늘리는 방식
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Text(
                                "장르 : ${this.value[index]['type'].toString()}"),
                          ),
                          Container(
                            //color: Colors.yellow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.person),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ),
                                IconButton(
                                  icon: Icon(Icons.favorite),
                                  color: Colors.grey,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

Route _createRoute(List data) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyApp2(data),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 1.0);
      // begin
      // Offset(dx, dy)
      // * dx     (왼쪽->오른쪽)-  0  +(오른쪽->왼쪽)
      // * dy     (위->아래)-  0  +(아래->위)
      // Ex> 1.0 1.0 (오른쪽->왼쪽,아래->위)
      var end = Offset.zero;
      // end
      // default : zero
      var curve = Curves.bounceInOut;
      var curve2 = Curves.slowMiddle;
      // Curves.() 애니메이션 효과를 만듭니다.

      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve))
          .chain(CurveTween(curve: curve2));
      // chain : 여러 개의 Tween 조합할 수 있다.
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}