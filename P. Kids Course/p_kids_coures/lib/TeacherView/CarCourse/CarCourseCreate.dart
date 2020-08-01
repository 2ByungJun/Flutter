import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kopo/kopo.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class CarCourseCreate extends StatefulWidget {
  @override
  _CarCourseCreateState createState() => _CarCourseCreateState();
}

class _CarCourseCreateState extends State<CarCourseCreate> {
  String adressValue = "주소지 추가를 눌러주세요!";

  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("주소지 등록",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[300],
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
                          controller: name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "주소지 이름",
                              icon: Icon(Icons.directions_car,
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
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.map,
                              color: Colors.orange[400],
                              size: 30.0
                            ),

                            Container(
                                margin: EdgeInsets.only(left: 17),
                                child: Text(adressValue)),
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

              /***** 주소지 등록 버튼 *****/
              Container(
                margin: EdgeInsets.all(5.0),
                child: RaisedButton(
                  child: Text(
                    "주소지 등록",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () async {
                    await http.post( _work.url + '/courseCreate',
                        body: {
                          "Name":name.text,
                          "Address":adressValue
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