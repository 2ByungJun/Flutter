import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pkidscoures/TeacherView/Attend/AttendView.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../PageManager.dart';

final _url = PageManagerView.url;

class AttendUpdate extends StatefulWidget {
  final String id;

  AttendUpdate({ Key key,@required this.id,}) : super(key: key);

  @override
  _AttendUpdateState createState() => _AttendUpdateState();
}

class _AttendUpdateState extends State<AttendUpdate> {
  final TextEditingController babyNm = TextEditingController();
  final TextEditingController parentsNm = TextEditingController();
  final TextEditingController phone = TextEditingController();

  Future<Map<dynamic, dynamic>> fetchSelect() async {
    http.Response _res = await http.post(_url + '/babySelect', body: {'id': widget.id.toString()});
    Map<dynamic, dynamic> _resBody = json.decode(_res.body);
    return _resBody;
  }

  @override
  Widget build(BuildContext context) {
    Work _work = Provider.of<Work>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("원아 코스변경",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
      ),

      body: FutureBuilder(
          future: fetchSelect(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            child: Text("변경하려면 코스를 클릭하세요!",style: TextStyle(fontSize: 15,color: Colors.black54,fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150.0,
                            child: FutureBuilder(
                              future: fetchCourse(),
                              builder: (BuildContext context,  AsyncSnapshot<List> snap) {
                                if (!snap.hasData)
                                  return Scaffold(
                                      body: Center(
                                          child: CircularProgressIndicator( valueColor:AlwaysStoppedAnimation<Color>(Colors.deepOrange))));
                                return ListView.builder(
                                  itemCount: snap.data.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await http.post(_url + '/babyCourseSelect', body: {
                                                "id": snap.data[index]['id'],
                                                "Select": snap.data[index]['fields']['Select'] });
                                          addressIdx =snap.data[index]['fields']['Idx'];
                                          address = snap.data[index]['fields']['Name'];
                                          addressDetail = snap.data[index]['fields']['Address'];
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 150.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
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
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    margin: EdgeInsets.all(6.0),
                                                    child: Text(
                                                      snap.data[index]['fields']['Idx'] + "번 코스",style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.bold),
                                                    )),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 6.0),
                                                    child: Text(snap.data[index]['fields']['Name'])),
                                                Container(
                                                    margin: EdgeInsets.only(left: 6.0),
                                                    child: Text(snap.data[index]['fields']['Address'])),
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

                          /***** 변경하기 버튼 *****/
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: CupertinoButton(
                              child: Text(
                                "변경하기",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.deepOrange,
                              onPressed: () async {
                                  await http.post(_work.url + '/babyUpdate',
                                      body: {
                                        "id": widget.id,
                                        "AddressIdx": addressIdx,
                                        "Address": address,
                                        "AddressDetail": addressDetail
                                      });

                                  Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
