import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../main.dart';

class AttendCreate extends StatefulWidget {
  @override
  _AttendCreateState createState() => _AttendCreateState();
}

class _AttendCreateState extends State<AttendCreate> {
  List<String> _label = ["달님반", "햇님반", "별님반"];
  String _selectedLabel;

  final TextEditingController babyNm = TextEditingController();
  final TextEditingController parentsNm = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("원아 계정 등록",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
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
                              labelText: "이름",
                              icon: Icon(Icons.account_circle,
                                  color: Colors.orange[400],
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
                              labelText: "학부모성함",
                              icon: Icon(Icons.person,
                                  color: Colors.orange[400],
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
                              labelText: "전화번호",
                              icon: Icon(Icons.call,
                                  color: Colors.orange[400],
                                  size: 30.0
                              )
                          ),
                        ),
                      ),

                      Container(
                        width: 300,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.list,
                              color: Colors.orange[400],
                              size: 40.0,
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10.0 ),
                              child: DropdownButton(
                                hint: Text('반 선택하기'),
                                value: _selectedLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLabel = newValue;
                                  });
                                },
                                items: _label.map((label){
                                  return DropdownMenuItem(
                                    child: new Text(label),
                                    value: label,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /***** 하단부 *****/
              Container(
                child: Text(
                  "모든 사항들을 기입해주세요!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /***** 회원가입 버튼 *****/
              Container(
                margin: EdgeInsets.all(5.0),
                child: RaisedButton(
                  child: Text(
                    "원아등록",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () async {
                    await http.post( _work.url + '/babyCreate',
                        body: {
                          "BabyName":babyNm.text,
                          "ParentsName":parentsNm.text,
                          "Label":_selectedLabel,
                          "Phone":phone.text
                    });
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}