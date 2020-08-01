import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AttendCreate.dart';

class AttendView extends StatefulWidget{
  @override
  _AttendViewState createState() => _AttendViewState();
}

class _AttendViewState extends State<AttendView> {
  List<String> _label = ["달님반", "햇님반", "별님반"];
  Map<String, String> _labelImg = {
    "달님반": "moon.png",
    "햇님반": "sun.png",
    "별님반": "star.png"
  };
  String _selectedLabel;

  /**
   * 여기에 선생님에 대한 담당 반을 default 로 설정해주면 된다.
   */
  String _selectedImg = "달님반";

  final _url = "http://192.168.0.130:3000";

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/baby");
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
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /***** 해당 반 선택 *****/
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 5.0, bottom: 5.0, right: 20.0),
                                  width: 70.0,
                                  height: 70.0,
                                  child: ClipOval(
                                    child: Image.asset(
                                        "images/" + _labelImg[_selectedImg],
                                        fit: BoxFit.cover),
                                  )),
                              Container(
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  iconSize: 24,
                                  iconEnabledColor: Colors.deepOrange,
                                  elevation: 16,
                                  focusColor: Colors.green,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                  underline: Container(
                                    height: 3,
                                    color: Colors.orange[300],
                                  ),
                                  hint: Text(
                                    '반 선택하기',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  value: _selectedLabel,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedLabel = newValue;
                                      _selectedImg = _selectedLabel;
                                    });
                                  },
                                  items: _label.map((label) {
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

                        /***** 아이 리스트 *****/
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 400.0,
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
                                  child: Card(
                                    child: ListTile(
                                        onTap: () {},
                                        onLongPress: null,
                                        leading: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          child: ClipOval(
                                            child: Image.asset(
                                                "images/" +
                                                    _labelImg[snap.data[index]
                                                        ['fields']['Label']],
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        title: Text(snap.data[index]['fields']
                                            ['BabyName']),
                                        subtitle: Text(snap.data[index]
                                                ['fields']['ParentsName'] +
                                            " : " +
                                            snap.data[index]['fields']
                                                ['Phone']),
                                        trailing: Checkbox(
                                          value: false,
                                          onChanged: (bool change) {
                                            setState(() {
                                              snap.data[index]['fields']
                                                  ['Attend'] = change;
                                            });
                                          },
                                        )),
                                  ),
                                );
                              },
                            ))
                      ])),
            );
          }),

      /***** 원아 등록 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AttendCreate()));
        },
        label: Text(
          "원아 등록",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
