import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pkidscoures/LoginView/loginView.dart';

import 'SerialKey2.dart';

class SerialKey1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/4,),

              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text("키즈코스에 어서오세요!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    ),
                    Container(
                      child: Text("키즈코스는 가입절차가 간단합니다!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    ),

                    Card(
                      color: Color.fromRGBO(236, 230, 204, 3.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("첫째, 진행상황에 맞춰 기입해주세요!", style: TextStyle(fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("둘째, 모든 상황은 빠짐없이 기입해주세요!", style: TextStyle(fontSize: 17),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("셋째, 마지막 제공되는 시리얼키는 꼭! 메모해주세요!", style: TextStyle(fontSize: 17),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height/8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton(
                        child: Text("취소", style: TextStyle(fontSize: 20.0),),
                        color: Colors.grey,
                        onPressed: (){  Navigator.pop(context); },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton(
                        child: Text("다음", style: TextStyle(fontSize: 20.0),),
                        color: Colors.deepOrangeAccent,
                        onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => SerialKey2()));
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height/4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/a1.PNG'),
                      fit: BoxFit.contain
                    )
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
