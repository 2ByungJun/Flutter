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
  // 3-(1). showSnackBar, Scaffold 용 글로벌 키 발급
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // 3-(2). Optical Animation
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3-(1). showSnackBar, 발급한 키를 Scaffold 에 등록
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("메인"),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () {},
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
//          mainAxisSpacing: 10.0,
//          crossAxisSpacing: 10.0,
        // 위젯 Card 용
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext bc, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyApp2(),
            )),
            child: Card(
              child: Container(
                color: Colors.red,

                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.yellow,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.more_horiz),
                    ),

                    // Q>
                    // 1. 클릭 가능하게해서 만들어서 Page 3로 이동
                    // 2. -> GestureDetector(), 다른 위젯이 있는지
                    // 3. -> 추가적으로 이벤트가 있는 위젯이 있는지 || 효과 등 -> 찾아보고 적용
                    // A>
                    // 2-(1). GestureDetector() : 하위 Container 까지 클릭이 적용
                    // 2-(2). InkWell() : 상단 Container 까지도 클릭이 적용
                    //        Container 와 같이 제스쳐기능을 제공하지 않는 위젯을 래핑하여 onTap 기능 제공
                    //        기본적으로 물결 표시 애니메이션인 'ripple' 효과를 지니고 있다.
                    // 3-(1). showSnackBar 기능
                    // 3-(2). AnimatedOpacity 기능
                    Container(
                      color: Colors.blue,
                      child: AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: opacityLevel,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              // 3-(1). showSnackBar 기능
                              scaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("InkWell Tap!")));
                              // 3-(2). AnimatedOpacity 기능
                              opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                            });
                              // 1. Page3 이동
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => MyApp3(),
//                          ),
//                        );
                          },
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(70.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2020/06/01/07/16/pieris-rapae-5245438__340.jpg",
                                    ),
                                    fit: BoxFit.cover // 가로와 높이에 따라 정비율로 늘려준다. , 높이만 fitHeight
                                    )
                            ),
//                  child: Image.network(
//                      "https://cdn.pixabay.com/photo/2020/06/01/07/16/pieris-rapae-5245438__340.jpg"
//                      ),
                          ),
                        ),
                      ),
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
                      child: Text("이름 ${index + 1}"),
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.person),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                          Text("|", style: TextStyle(color: Colors.grey,fontSize: 20.0),),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.grey,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
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

class MyApp3 extends StatefulWidget {
  @override
  _MyApp3State createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
      ),
    );
  }
}
