import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메인"),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: (){},
          ),
        ],
      ),

      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150.0,
                color: Colors.green[200],
              ),
            ],
          ),
        ),
      ),

      body: GridView.builder(
        // 주어진 갯수 만큼, 우리가 정한 템플릿이 반복됨
        // 갯수가 0 ~ 개수-1
        // -> List
        padding: EdgeInsets.all(10.0),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext bc, int index){
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyApp2(),
              )
            ),
            child: Container(
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz),
                  ),
                  // 1. 클릭 가능하게해서 만들어서 Page 3로 이동
                  // 2. -> GestureDetector(), 다른 위젯이 있는지
                  // 3. -> 추가적으로 이벤트가 있는 위젯이 있는지 || 효과 등 -> 찾아보고 적용
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                      borderRadius: BorderRadius.circular(70.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2020/06/01/07/16/pieris-rapae-5245438__340.jpg",
                        ),
                        fit: BoxFit.cover // 가로와 높이에 따라 정비율로 늘려준다. , 높이만 fitheight
                      )
                    ),
//                  child: Image.network(
//                      "https://cdn.pixabay.com/photo/2020/06/01/07/16/pieris-rapae-5245438__340.jpg"
//                      ),
                  ),
                  Container(
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ), // 자기자신을 늘리는 방식
                    margin: EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Text("이름 ${index+1}"),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){},
            leading: Icon(Icons.access_time),
            title: Text("TITLE"),
            subtitle: Text("Sub..."),
            trailing: Icon(Icons.access_time),
          );
        },
      ),
    );
  }
}

