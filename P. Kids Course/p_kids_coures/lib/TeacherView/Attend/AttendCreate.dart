import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pkidscoures/TeacherView/Attend/AttendView.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../PageManager.dart';

  final _url = PageManagerView.url;

  class AttendCreate extends StatefulWidget {
    @override
    _AttendCreateState createState() => _AttendCreateState();
  }

    Future<List> fetchCourse() async {
      http.Response _res = await http.get(_url + "/babyCourseList");
      List<dynamic> _resBody = json.decode(_res.body);
      return _resBody;
    }


  var addressIdx = '';
  var address = '';
  var addressDetail = '';
  class _AttendCreateState extends State<AttendCreate> {
    final TextEditingController babyNm = TextEditingController();
    final TextEditingController parentsNm = TextEditingController();
    final TextEditingController phone = TextEditingController();

    @override
    Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("원아 계정 등록",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),

              Container(
                child: Text("모든 사항들을 기입해주세요!", style: TextStyle( fontSize: 15, color: Colors.black54, fontWeight: FontWeight.bold, ), ),
              ),

              /***** InputBox *****/
              Card(
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          child: TextField(
                            controller: babyNm,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "원아 이름",
                                icon: Icon(Icons.account_circle,
                                    color: Colors.deepOrange,
                                    size: 30.0
                                )
                            ),
                          ),
                        ),

                        Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          child: TextField(
                            controller: parentsNm,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "학부모 성함",
                                icon: Icon(Icons.person,
                                    color: Colors.deepOrange,
                                    size: 30.0
                                )
                            ),
                          ),
                        ),

                        Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.all(5.0),
                          child: TextField(
                            controller: phone,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "- 포함하여 입력해주세요",
                                icon: Icon(Icons.call,
                                    color: Colors.deepOrange,
                                    size: 30.0
                                )
                            ),
                          ),
                        ),

                      ]
                  ),
                ),
              ),

              Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text('기본 주소지를 선택해주세요!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),)
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: FutureBuilder(
                  future: fetchCourse(),
                  builder: (BuildContext context, AsyncSnapshot<List> snap){
                    if (!snap.hasData) return Scaffold(body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange))));
                    return ListView.builder(
                      itemCount: snap.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              http.post(_url + '/babyCourseSelect', body: {
                                "id": snap.data[index]['id'],
                                "Select" : snap.data[index]['fields']['Select']
                              });
                              addressIdx = snap.data[index]['fields']['Idx'];
                              address = snap.data[index]['fields']['Name'];
                              addressDetail = snap.data[index]['fields']['Address'];
                              setState(() {});
                            },
                            child: Container(
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: snap.data[index]['fields']['Select'] =='Y' ? Colors.green : Colors.deepOrange,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-1.0, -1.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(margin: EdgeInsets.all(6.0) , child: Text(snap.data[index]['fields']['Idx'] + "번 코스", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),)),
                                    Container(margin: EdgeInsets.only(left: 6.0) , child: Text(snap.data[index]['fields']['Name'])),
                                    Container(margin: EdgeInsets.only(left: 6.0) , child: Text(snap.data[index]['fields']['Address'])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              /***** 회원가입 버튼 *****/
              Container(
                margin: EdgeInsets.all(5.0),
                child: CupertinoButton(
                  child: Text( "원아등록", style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold, ), ),
                  color: Colors.deepOrange,
                  onPressed: () {
                    bool chk = false;
                    if(babyNm.text != ''){
                      if(parentsNm.text != ''){
                        if(phone.text != '') {
                          chk = true;
                        }
                      }
                    }

                    if(chk == true){
                      http.post(_work.url + '/babyCreate', body: {
                        "BabyName": babyNm.text,
                        "ParentsName": parentsNm.text,
                        "Phone": phone.text,
                        "AddressIdx": addressIdx,
                        "Address": address,
                        "AddressDetail": addressDetail
                      });
                      Navigator.pop(context);
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('비어있는 부분이 존재합니다.', style: TextStyle(fontWeight: FontWeight.bold),),
                              content: Text('원아를 등록하려면 모든 사항들을 \n기입해주세요.'),
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
            ],
          ),
        ),
      )
    );
  }
}