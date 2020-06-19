import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Conn extends StatefulWidget {
  @override
  _ConnState createState() => _ConnState();
}

class _ConnState extends State<Conn> {

  final String _url = "http://172.30.1.29:3000";

  List<DataModel> datas;

  Future<List<DataModel>> fetch() async{
    http.Response _res = await http.get("$_url/datas");
    List<dynamic> _resBody = json.decode(_res.body);
    // map : 가공한 배열을 반환(다른 곳에서 활용)
    // foreach : 반복만 해서 실행만 하면 된다.(반환값은 필요없어!)
    // 여기 오는 e는 dynamic 이므로, id 값이 int인지 모른다. 그래서 확실히 int.parse로 변환해줘야한다.
    // toList() : Interable 에만 있다.
    return _resBody.map(
            (e) => new DataModel(
                id: int.parse(e['id'].toString()),
                title: e['title'].toString(),
                src: e['src'].toString())
    ).toList();
  }

  @override
  void initState() {
    Future.microtask(() async => this.datas = await fetch())
    .then((_) => setState((){}));
//    Future.microtask(() async {
//      this.datas = await fetch();
//      setState(() {
//      });
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.datas == null
        ? Text("로딩 중...")
        : GridView.builder(
          itemCount: this.datas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0
          ),
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(this.datas[index].src),
            )
          ),
          child: Text(this.datas[index].title),
        ),
      )
    );
  }
}

class DataModel{
  int id;
  String title;
  String src;
  DataModel({@required this.id, @required this.title, @required this.src})
  : assert(title != null), assert(src != null);

  // factory : 조금 가벼운 인스턴스를 만들어준다.
}