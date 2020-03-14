import 'package:flutter/material.dart';
import 'package:memomemo/database/memo.dart';
import 'package:memomemo/database/db.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';
  // 데이터 베이스에 변수를 전달하기 위함

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 저장하기, 지우기 기능
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: saveDB,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String title){ this.title = title;},
                // 내용이 title로 넘어가고 title이 this.title로 넘어가게 된다.
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.multiline,
                maxLines: null, // 이 문장이 없다면 줄에 제한이 걸린다.
                //obscureText: true, : 패스워드 처럼 작성 글을 안보이게 하는 기능
                decoration: InputDecoration(
                  //border: OutlineInputBorder(), : 박스형으로 테두리 기능
                  hintText: '제목을 적어주세요.',
                ),
              ),
              // TextField 끼리 붙으면 문제가 생길 수 있으므로, 사이에 padding을 추가한다.
              Padding( padding: EdgeInsets.all(10)),

              TextField(
                onChanged: (String text){ this.title = title;},
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '메모의 내용을 적어주세요.'
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> saveDB() async {

    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2sha512(DateTime.now().toString()), // 에러 이유 : int , memo.dart로
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos()); // 저장 데이터가 잘 저장되어있는지 확인용
  }

  String Str2sha512(String text) { // String가 들어오면 sha256으로 바꿔주는 함수
    var bytes = utf8.encode(text); // data being hashed
    var digest = sha512.convert(bytes);
    return digest.toString();

  }
}
