#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=xwavfU4_zeI&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=19)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/f03c67df-e507-4cd0-9ad6-4b26d7cf9a03/%EB%85%B9%ED%99%94_2020_06_04_16_22_40_966.gif)

---

### 2. kakao maps api 주소 검색
kakao에서 무료로 제공하는 주소 검색 서비스입니다!

#### 2-1. 준비
*  kopo: ^0.1.1을 적용!
![](https://images.velog.io/images/ieed0205/post/1ba314f0-0ad6-4911-b683-0c908f748f81/1.PNG)

* pakages get은 잊지 말자구요!
![](https://images.velog.io/images/ieed0205/post/5134fe77-151d-4583-b269-b3b16f9e2e79/2.PNG)

#### 2-2. import 적용
```
import 'package:kopo/kopo.dart';
```

#### 2-3. 변수
```
  String adressValue = "주소를 검색해주세요";
```


나머지 부분은 하단 코드를 참고해주세요 :)

---

### 3. 소스코드
```
import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';

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
  String adressValue = "주소를 검색해주세요";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('17. Flutter tutorial KOR Adress'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.adressValue),
            RaisedButton(
              child: Text("주소 검색"),
              onPressed: () async {
                var result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Kopo()
                  )
                );

                if(result != null){
                  setState(() {
                    this.adressValue = result;
                  });
                }
              },
            )
          ],
        ),
      ),

    );
  }
}
```


#### 기억보단 기록하자! LEE'Today로!