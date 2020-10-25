import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController serialKey = TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _url = "http://192.168.17.109:3000";
  var tokenId = "";

  @override
  void initState() {
    _firebaseMessaging.getToken().then((String token){
      print('token:'+token);
      tokenId = token;
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**** 비율이 달라질 경우 대비 ****/
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(200),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red[300],
                offset: Offset(10.0, 10.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(10.0, 10.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /***** 상단부 *****/
              Container(
                child: Text( "키즈코스", style: TextStyle(fontSize: 40, color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold
                 ),
                ),
              ),
              Container(
                child: Text( "어린이집 차량지도를 보다 빠르게!", style: TextStyle( fontSize: 20, color: Colors.orange[300], fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /***** 로고 *****/
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 10.0, color: Colors.orange[300])),
                  child: ClipOval(
                    child: Image.asset("images/logo.gif", fit: BoxFit.cover),
                  )
              ),

              /***** InputBox *****/
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 50,
                        child: TextField(
                          controller: serialKey,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '시리얼 키',
                              icon: Icon(Icons.vpn_key, color: Colors.orange[300], size: 40.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /***** 버튼(로그인&회원가입) *****/
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 250,
                      child: CupertinoButton(
                        child: Text( "접속", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.red[300],
                        onPressed: () async {
                          http.Response _res = await http.post( _url + '/login2', body: { "serialKey": serialKey.text });
                          print(_res.body);
                          /*****  API Key 체크 *****/
                          // ignore: unrelated_type_equality_checks
                          if(_res.body == "true"){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => MyApp()), (route) => false);
                          }else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('존재하지 않는 시리얼 키입니다.', style: TextStyle(fontWeight: FontWeight.bold),),
                                  content: Text('만약 시리얼 키가 없으시다면! \n요청 버튼을 눌러 발급받으시길 바랍니다.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('확인'),
                                      onPressed: (){
                                        Navigator.pop(context, "확인");
                                      },
                                    )
                                  ],
                                );
                              }
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),

              /***** 하단부 *****/
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text( "학부모 전용 App", style: TextStyle( fontSize: 20, color: Colors.red[300], fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
