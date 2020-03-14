import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:memomemo/database/memo.dart';
import 'package:memomemo/database/db.dart';
import 'package:memomemo/screens/view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5, top: 40, bottom: 20),
            child: Container(
              child: Text('메모메모',
                style: TextStyle(fontSize: 36, color: Colors.blue),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(child: memoBuilder(context))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        // extended는 확장된 기능을 사용할 때 이용
        onPressed: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => EditPage())
            // Routing 기능 => 패키지를 넘나드는 기술
          ); // push는 위로 올리게 즉, 이동하게 해주는 함수
        }, // edit.dart로 옮겨지게 한다.
        tooltip: '메모를 추가하려면 클릭하세요',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다."),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                });
                deleteId = '';
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                deleteId = '';
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }

  Widget memoBuilder(BuildContext parentcontext) {
    return FutureBuilder(
      builder: (context, Snap) {
        if (Snap.data.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              '지금 바로 "메모 추가" 버튼을 눌러\n 새로운 메모를 추가해보세요!\n\n\n\n\n',
              style: TextStyle(fontSize: 25, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          itemCount: Snap.data.length,
          itemBuilder: (context, index) {
            Memo memo = Snap.data[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  parentcontext, CupertinoPageRoute(builder: (context) => ViewPage(id : memo.id)));
              },
              onLongPress: () {
                deleteId = memo.id;
                showAlertDialog(parentcontext);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(memo.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text(memo.text, style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("최종 수정 시간: " + memo.editTime.split('.')[0],
                            style: TextStyle(fontSize: 11),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ]),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlue, blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(12), // 타원형, 깎인 각도
                ),
              ),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}