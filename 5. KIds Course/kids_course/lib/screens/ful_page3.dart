import 'package:flutter/material.dart';

class fulpage3 extends StatefulWidget {
  @override
  _fulpage3State createState() => _fulpage3State();
}

class _fulpage3State extends State<fulpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("선생님1 : 010-2222-2222"),
            Text("선생님2 : 010-2222-2222"),
            Text("선생님3 : 010-2222-2222"),
            Text("학부모 관리 데이터베이스"),
            Text("학부모 관리 데이터베이스"),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {},
        tooltip: '원아 계정을 추가',
        label: Text('원아계정 등록',
        style: TextStyle(fontSize: 17,
        fontWeight: FontWeight.bold) ),
        icon: Icon(Icons.add,),
      ),
    );
  }
}
