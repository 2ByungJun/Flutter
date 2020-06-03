#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=IiiH7hslfCA&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=14)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/0e7c83f6-4be2-454a-b7ad-fe7dc71872a3/%EB%85%B9%ED%99%94_2020_06_03_16_08_22_824.gif)

---

### 2. Navigator_data
Naviator은 기본적으로 push, pop을 하여 서로의 페이지를 이동시켜 주는 기능입니다!
여기서 서로의 페이지에 data를 전달하려면 추가적으로 적용시켜야 할 것들에 대해 알아봅시다!

#### 2-1. Page(1)
페이지 1 입니다!

```
Scaffold(
      appBar: AppBar(
        title: Text("12. Navigator Tutorial-Data(push)"),
        centerTitle: true,
      ),

	  // 전반적으로 변경
      body: Container(
        width: MediaQuery.of(context).size.width, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Data: Value"),
            ),
            RaisedButton(
              child: Text("페이지 이동"),
              onPressed: () async {
                String backValue = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageTwo(data:"Value") // data전달 "Value"문자열
                  ),
                );
                print(backValue);
              },
            ),
          ],
        ),
      ),
     );
```
이와같이 PageTwo로 data인 "Value" 문자열을 전달해보았습니다.
그렇담 PageTwo에서는 Page(1)에서 보낸 데이터를 받기 위해 객체 내에 data변수를 만들어 주어야 합니다.

#### 2-1. Page(2)
페이지 2입니다.

```
class PageTwo extends StatefulWidget {

  String data;  // 데이터 변수
  PageTwo({@required this.data}); // 데이터 생성자

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12. Navigator Tutorial-Data(pop)"),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(widget.data.toString()),
            ),
            RaisedButton(
              child: Text("뒤로 돌기"),
              onPressed: (){
                Navigator.of(context).pop("Back Value"); // pop데이터를 page(1)에서 저장
              },
            ),
          ],
        ),
      ),
    );
  }
}

```

프린트 결과로 Page(1)에서 print(backValue); 값은 다음과 같이 출력됩니다!
![](https://images.velog.io/images/ieed0205/post/b79f6c75-a822-4caf-92ab-e8796804a0b5/15151.PNG)

---

### 3. 소스코드
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        title: Text("12. Navigator Tutorial-Data(push)"),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Data: Value"),
            ),
            RaisedButton(
              child: Text("페이지 이동"),
              onPressed: () async {
                String backValue = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageTwo(data:"Value")
                  ),
                );
                print(backValue);
              },
            ),
          ],
        ),
      ),
     );
  }
}

class PageTwo extends StatefulWidget {

  String data;
  PageTwo({@required this.data});

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12. Navigator Tutorial-Data(pop)"),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(widget.data.toString()),
            ),
            RaisedButton(
              child: Text("뒤로 돌기"),
              onPressed: (){
                Navigator.of(context).pop("Back Value");
              },
            ),
          ],
        ),
      ),
    );
  }
}

```


#### 기억보단 기록하자! LEE'Today로!