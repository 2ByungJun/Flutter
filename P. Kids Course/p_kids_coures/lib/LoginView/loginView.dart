import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pkidscoures/LoginView/SerialKey1.dart';
import 'package:pkidscoures/TeacherView/PageManager.dart';
import 'package:http/http.dart' as http;

final _url = PageManagerView.url;

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController serialKey = TextEditingController();

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
                color: Colors.orange[400],
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
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 10.0, color: Colors.orange[300])),
                  child: ClipOval(
                    child: Image.asset("images/logo2.PNG", fit: BoxFit.cover),
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
                              icon: Icon(Icons.vpn_key, color: Colors.orange[400], size: 40.0),
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
                        color: Colors.orange[400],
                        onPressed: () async {
                          http.Response _res = await http.post( _url + '/login', body: { "serialKey":serialKey.text });

                          /*****  API Key 체크 *****/
                          // ignore: unrelated_type_equality_checks
                          if(_res.body == "true"){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => PageManagerView()), (route) => false);
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
                  SizedBox(
                    width: 250,
                    child: CupertinoButton(
                      child: Text( "시리얼 키 요청", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,
                      ),
                      ),
                      color: Colors.deepOrangeAccent[400],
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute( builder: (context) => SerialKey1()));
                      },
                    ),
                  ),
                ],
              ),

              /***** 하단부 *****/
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text( "보육교사 전용 App", style: TextStyle( fontSize: 20, color: Colors.orange[300], fontWeight: FontWeight.bold,
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
