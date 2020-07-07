import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Conn extends StatefulWidget {
  @override
  _ConnState createState() => _ConnState();
}

class _ConnState extends State<Conn> {

  final String _url = "http://192.168.2.132:3000";

  List<DataModel> datas;

  TextEditingController _controller = new TextEditingController(text: "");

  Future<List<DataModel>> fetch() async{
    http.Response _res = await http.get("$_url/datas");
    List<dynamic> _resBody = json.decode(_res.body);
    // map : 가공한 배열을 반환(다른 곳에서 활용)
    // foreach : 반복만 해서 실행만 하면 된다.(반환값은 필요없어!)
    // 여기 오는 e는 dynamic 이므로, id 값이 int인지 모른다. 그래서 확실히 int.parse로 변환해줘야한다.
    // toList() : Interable 에만 있다.
    return _resBody.map(
//            (e) => new DataModel(
//                id: int.parse(e['id'].toString()),
//                title: e['title'].toString(),
//                src: e['src'].toString()
    // factory 적용
        (e) => DataModel.toJson(e)
    ).toList();
  }

  Future<bool> updateFetch({@required int id, @required String data}) async{
    final String _url = this._url+"/data/$id";
    final Map<String, String> _header = {
      "Key" : "1111111"
    };
    final Map<String, String> _body = {
      "data": data
    };
    // HTTP : (클라) 예외처리
    // 1. 클라이언트 연결 불가 - 500
    // 2. 연결시간 초과 - 400 onTimeout()
    http.Response _res;
    try{
      _res = await http.post(_url, headers: _header, body: _body)
      .timeout(Duration(seconds: 5),
      onTimeout: () async => http.Response("false", 400));
    } catch(e){
      _res = http.Response("false", 500);
    }
    // 3. (서버 반환) 값이 변경되었을 때
    var _result = json.decode(_res.body);
    return _result.runtimeType != bool ? false : _result; // UX : 사용자 경험
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
      appBar: AppBar(
        title: TextField(
          controller: _controller,
        ),
      ),
      body: this.datas == null
        ? Text("로딩 중...")
        : GridView.builder(
          itemCount: this.datas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0
          ),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
//          onTap: () => Future.microtask(() async => await this.updateFetch(id: index, data: "$index+DATA")),
            onTap: () async{
              bool _check = await this.updateFetch(id: index, data: _controller.text);
              if(!_check) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("수정 불가"),
                    )
                );
                return;
              }
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("수정 완료"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("닫기"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                )
              );
              return ;
            },

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(this.datas[index].src),
              )
            ),
            child: Text(this.datas[index].title),
          ),
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
  factory DataModel.toJson(dynamic json) => new DataModel(
    id: json['id'] as int, // as가 형변환 역할
    title: json['title'] as String,
    src: json['src'] as String
  );
}