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
        title: Text("02.Container tutorial"),
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
        width: 100.0,
        height: 100.0,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        alignment: Alignment.center,
        // color: Colors.red[200],

        decoration: BoxDecoration(
          color:Colors.red,
          image:DecorationImage(
            image: NetworkImage("http://")
          ),
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50),
          // <List> boxShadow
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5)
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(3, 3)
            )
          ]
        ),

        child: Center(
          child: Text(
            "Body",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),

      // <widget> 플로팅 버튼
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: ()=> {
          print('플로팅액션 버튼 실행')
        },
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

