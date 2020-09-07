import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../main.dart';
import 'SerialKey5.dart';

class SerialKey4 extends StatelessWidget {
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/4,
                child: Container(
                  margin: EdgeInsetsDirectional.only(top:20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/call.PNG'),
                          fit: BoxFit.contain
                      )

                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text("Step3. 원장님의 전화번호를 작성해주세요!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    ),

                    Card(
                      color: Colors.orange[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: phone,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '클릭하세요!',
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      child: Text("- 빼고 작성해주시길 바랍니다!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
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
                        child: Text("이전", style: TextStyle(fontSize: 20.0),),
                        color: Colors.grey,
                        onPressed: (){ Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton(
                        child: Text("다음", style: TextStyle(fontSize: 20.0),),
                        color: Colors.deepOrangeAccent,
                        onPressed: (){
                          if( phone.text != ""){
                            http.post( _work.url + '/teacherCreate', body: { "phone" : phone.text });
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SerialKey5()));
                          }else{
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return AlertDialog(
                                    title: Text('전화번호를 입력해주세요!', style: TextStyle(fontWeight: FontWeight.bold),),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('확인'),
                                        onPressed: (){Navigator.pop(context, "확인"); },
                                      )
                                    ],
                                  );
                                }
                            );
                          }
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
                          image: AssetImage('images/a4.PNG'),
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
