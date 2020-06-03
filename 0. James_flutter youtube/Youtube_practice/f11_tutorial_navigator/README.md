#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=DoxlUW4_Phg&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=9)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/2d408654-0051-42f0-8c5e-cfbb18068a83/%EB%85%B9%ED%99%94_2020_06_03_15_51_09_896.gif)

---

### 2. Navigator
Naviator은 기본적으로 push, pop을 하여 서로의 페이지를 이동시켜 주는 기능입니다!

#### 2-1. Page(1)
페이지 1의 view입니다.

![](https://images.velog.io/images/ieed0205/post/32ca664f-b1e5-4c44-a136-b9e0a881ef47/1.PNG)

```
Scaffold(
      appBar: AppBar(
        title: Text("11. Navigator Tutorial-page(1)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("페이지 이동"),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PageTwo()
              )
            );
          },
        ),
      ),
     );
```

#### 2-1. Page(2)
페이지 2의 view입니다.
Navigator.of(context).pop();을 하게되면 자동적으로 Appbar에 <- 화살표를 생성해 준답니다!

![](https://images.velog.io/images/ieed0205/post/70180c7c-994e-48a7-9914-c320aedf7790/2.PNG)

```
class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11. Navigator Tutorial-page(2)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("뒤로 돌기"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
```


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
        title: Text("11. Navigator Tutorial-page(1)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("페이지 이동"),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PageTwo()
              )
            );
          },
        ),
      ),
     );
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("11. Navigator Tutorial-page(2)"),
        centerTitle: true,
      ),

      body: Center(
        child: RaisedButton(
          child: Text("뒤로 돌기"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

```


#### 기억보단 기록하자! LEE'Today로!