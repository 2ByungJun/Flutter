import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pkidscoures/TeacherView/PageManager.dart';

class CarSubView extends StatefulWidget{

  @override
  _CarSubViewState createState() => _CarSubViewState();
}

class _CarSubViewState extends State<CarSubView> {
  final _url = PageManagerView.url;

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/fcmList");
    return json.decode(_res.body);
  }

  var fcmList = [];
  List<String> titles = new List<String>(50);
  List<String> texts = new List<String>(50);

  @override
  void initState() {
    Future.microtask(() async{
      fcmList = await this.fetch();
      setState(() {});
      print(fcmList);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    titles = new List<String>(fcmList.length);
    texts = new List<String>(fcmList.length);

    /// 데이터 셋팅
    for(int i=0; i<fcmList.length; i++){
      titles[i] = fcmList[i]['fields']['title'];
      texts[i] = fcmList[i]['fields']['text'];
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView.separated(
          itemCount: fcmList.length,
          itemBuilder: (context,index){
            print(titles[index]);
            print(texts[index]);
            return ListTile(
              leading: Icon(Icons.add_alert, color: Colors.red[200],size: 30.0, ),
              title: Text(titles[index]),
              subtitle: Text(texts[index]),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        )
      )
    );
  }
}