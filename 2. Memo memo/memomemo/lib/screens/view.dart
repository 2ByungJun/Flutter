import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memomemo/database/memo.dart';
import 'package:memomemo/database/db.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key key, this.id}) : super(key: key);
  final String id;
  //findMemo(id)[0]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 저장하기, 지우기 기능
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {}, // delete 페이지
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {}, // edit 페이지
            )
          ],
        ),
        body: Padding(padding: EdgeInsets.all(20), child: LoadBuilder()));
  }

  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }

  LoadBuilder() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(id),
      builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot) {
        if (snapshot.data.isEmpty) {
          return Container(child: Text("데이터를 불러올 수 없습니다."));
        } else {
          Memo memo = snapshot.data[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(memo.title, style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500),),
              Text("메모를 만든 시간: " + memo.createTime.split('.')[0],
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.end,
              ),
              Text("메모를 수정 시간: " + memo.editTime.split('.')[0],
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.end,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(child: Text(memo.text)),
            ],
          );
        }
      },
    );
  }
}
