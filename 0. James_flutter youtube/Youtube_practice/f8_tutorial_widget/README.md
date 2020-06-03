#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=DoxlUW4_Phg&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=9)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/40cb5797-7090-450d-ba83-1c68a61d1d24/%EB%85%B9%ED%99%94_2020_06_03_14_55_53_823.gif)

---

### 2. Widgets

* Container
* Text
* SingleScroll
* ChildView
* Cilumn
* Row
* ListView
* GridView


#### 2-1. SingleChildScrollView
박스 안에 있는 위젯들을 스크롤링 가능하게 해준다!

![](https://images.velog.io/images/ieed0205/post/dc8e00b6-9bd7-4b74-8a72-0006b494401a/%EB%85%B9%ED%99%94_2020_06_03_15_01_08_241.gif)

```
Scaffold(
      appBar: AppBar(
        title: Text("f8 위젯 모음"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text("ListView"),
                ),
```

#### 2-2. ListView
ListView 부분이다.

![](https://images.velog.io/images/ieed0205/post/837cb10d-4470-4418-a098-dbc674ca4a60/%EB%85%B9%ED%99%94_2020_06_03_15_00_42_153.gif)

```
child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      width: 145.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0
                      ),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text("ListView $index"),
                      ),
                    );
                  },
                ),
```

#### 2-3. GridView
GridView 부분이다.

![](https://images.velog.io/images/ieed0205/post/65325ee0-2a2e-4a96-b188-aa5f71d2fb17/%EB%85%B9%ED%99%94_2020_06_03_15_00_53_447.gif)

```
child: GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text("GridView $index"),
                      ),
                    );
                  },
                ),
```

---

### 3. 소스코드
```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("f8 위젯 모음"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text("ListView"),
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      width: 145.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0
                      ),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text("ListView $index"),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("GridView"),
              ),
              Container(
                height: 300.0,
                child: GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index){
                    return Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text("GridView $index"),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.blue[200],
                margin: EdgeInsets.all(5.0),
                height: 500.0,
                child: Center(
                  child: Text(
                    "Contents",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}

```


#### 기억보단 기록하자! LEE'Today로!