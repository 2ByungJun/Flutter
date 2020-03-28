import 'package:flutter/material.dart';
import 'package:kids_course/memodata/db.dart';
import 'package:kids_course/memodata/memo.dart';

class EditPage extends StatefulWidget {
  EditPage({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  BuildContext _context;

  String title = '';
  String text = '';
  String createTime = '';

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: updateDB, // 덮어쓰기를 위한 메서드
            )
          ],
        ),
        body: Padding(padding: EdgeInsets.all(20), child: loadBuilder()));
  }

  // view page 와 같은 형식의 데이터를 불러오는 코드
  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }

  loadBuilder() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(widget.id),
      builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot) {
        if (snapshot.data == null || snapshot.data == []) {
          return Container(child: Text("데이터를 불러올 수 없습니다."));
        } else {
          Memo memo = snapshot.data[0];

          var tecTitle = TextEditingController();
          title = memo.title;
          tecTitle.text = title;

          var tecText = TextEditingController();
          text = memo.text;
          tecText.text = text;

          createTime = memo.createTime;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: tecTitle,
                maxLines: 2,
                onChanged: (String title) {
                  this.title = title;
                },
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                //obscureText: true,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: '메모의 제목을 적어주세요.',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: tecText,
                maxLines: 8,
                onChanged: (String text) {
                  this.text = text;
                },
                //obscureText: true,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: '메모의 내용을 적어주세요.',
                ),
              ),
            ],
          );
        }
      },
    );
  }

  void updateDB() {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: widget.id,
      // String
      title: this.title,
      text: this.text,
      createTime: this.createTime,
      editTime: DateTime.now().toString(),
    );

    sd.updateMemo(fido);
    Navigator.pop(_context);
  }
}