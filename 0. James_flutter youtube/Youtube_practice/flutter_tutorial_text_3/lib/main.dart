import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  title: 'My app', // used by the OS task switcher
  home: MyScaffold(),
));

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바
      appBar: AppBar(
        title: Text("03.Text tutorial"),
        centerTitle:true, // 중앙정렬
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          )
        ],
      ),

      // <widget> 햄버거 버튼과 같은 아이콘 설정
      drawer: Drawer(),

      // <widget>:body, <class>:Container
      // 배경
      body: Container(
           child: Column(
             children: <Widget>[
               Text(
                "${(1+1).toString()}. 텍스트 위젯",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                )
                ),
               const Text.rich(
                 TextSpan(
                   text: 'Hello', style: TextStyle(fontSize: 40.0), // default text style
                   children: <TextSpan>[
                     TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                     TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],
                 ),
               )
             ],
           ),
      ),

      // <widget> 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
      ),

      // <widget> 하단 네비게이션 기능
      bottomNavigationBar: BottomNavigationBar(
        // List<BottomNavigationBar> 아이템 (3)
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text("Menu")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favorite")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings")
          ),
        ],
      ),
    );
  }
}

