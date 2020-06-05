import 'package:flutter/material.dart';

// dart : new 항상 생략되어 있다.
// ctrl + space : 속해있는 인자 및 하위 파라미터 확인
// ctrl + q : 상세정보
// => : Allow Funtion : void main() => "void",
//                      String st() => "hi"
//                      Widget Text() => new Text("완료")

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    print("1 INIT");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("2 DID");
    super.didChangeDependencies();
  }

//  Text txt = new Text("완료"); // 객체로 생성하여 사용 가능하다.
//  Text txt2() => new Text("완료2"); // 함수로 생성하여 사용 가능하다.

  String value = "시작";

  @override
  Widget build(BuildContext context) {
    print("3.Build"); // 한번만 실행된다는 보장은 없다.
    // print(MediaQuery.of(context).size.width); 전체 사이즈를 확인(why 쓸까?)
    // Scaffold : 하나의 페이지이다.
    return Scaffold(
      appBar: AppBar(),
//      body: Container(
//        color: Colors.red,
//        width: MediaQuery.of(context).size.width*0.3,
//        전체 사이즈를 확인시켜준다.
//        height: 200.0, // int / double / num(int || double)
//      ),
      body: Column(
        children: <Widget>[
//          txt, // Text txt = new Text("완료");
//          txt2(), // Text txt2() => new Text("완료2");
          Text(value),
          RaisedButton(
            child: Text("버튼"),
//          onPressed: (){
//            func();
//          },
//            onPressed: null, // 버튼을 클릭하지 못하게 할 액션
            // setState() : 완벽한 순서를 보장하기위함.
            onPressed: () {
              setState(() {
                value = "완료";
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp2()));
            },
          ),
        ],
      ),
    );
  }
}

// 위젯 관리하는법
// 1. Widget 를 모아놓는 class 생성
// 2. Widget 을 funtion 으로 생성

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              // pushReplacement : 스택에서 페이지를 제외시켜준다.
//              Navigator.of(context).pushReplacement(
//                MaterialPageRoute(
//                  builder: (context) => MyApp3()
//                )

              // pushAndRemoveUntil : 마지막 스택으로 보낼 때
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyApp3()),
                  (r) => false // false/ture
                  );
            },
          ),
        ],
      ),
    );
  }
}

class MyApp3 extends StatefulWidget {
  @override
  _MyApp3State createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("세번째 페이지"),
      ),
    );
  }
}


class MyApp5 extends StatefulWidget {
  @override
  _MyApp5State createState() => _MyApp5State();
}

class _MyApp5State extends State<MyApp5> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RaisedButton(
          onPressed: (){
            setState(() {

            });
          },
        ),
      ),
    );
  }
}

