import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'loginView.dart';




class SerialKey5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height/4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text("감사합니다!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    ),
                    Container(
                      child: Text("이제 키즈코스를 사용할 수 있습니다!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Container(
                  margin: EdgeInsetsDirectional.only(top:20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/logo.gif'),
                          fit: BoxFit.contain
                      )

                  ),
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
                        child: Text("배급받기", style: TextStyle(fontSize: 20.0),),
                        color: Colors.deepOrangeAccent,
                        onPressed: (){
                          http.post( _work.url + '/teacherCreate', body: { "check" : "1" });
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()), (route) => false);
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
                          image: AssetImage('images/a5.PNG'),
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
