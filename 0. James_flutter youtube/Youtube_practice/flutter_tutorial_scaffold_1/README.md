#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=mXWZanNLrCU&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=3)

### 1. UI
![](https://images.velog.io/images/ieed0205/post/97116e6e-130a-46ab-8057-2ca1a54e8f6a/%EC%BA%A1%EC%B2%98.PNG)

### 2. Scaffold

#### 2-0. main
기본적으로 Scaffold는 Material Design visual layout 구조를 구현!

```
void main() => runApp(MaterialApp(
  title: 'My app', // used by the OS task switcher
  home: MyScaffold(),
));
```

#### 2-1. AppBar
![](https://images.velog.io/images/ieed0205/post/c85170a2-d56d-43fb-b2d8-5612cdb44275/appbar.PNG)
```
Scaffold(
      // 앱바
      appBar: AppBar(
        title: Text("01.Scaffold tutorial"),
        centerTitle:true, // 중앙정렬
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          )
        ],
      ),
```
#### 2-2. Drawer
Appbar 없이도 사용 가능
```
drawer: Drawer(),
```

#### 2-3. Body
![](https://images.velog.io/images/ieed0205/post/7e268da3-4591-4099-a455-d0fc19b2c131/body.PNG)
```
 body: Container(
        color: Colors.red[200],
        child: Center(
          child: Text(
            "Body",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
```

#### 2-4. FloatingActionButton
![](https://images.velog.io/images/ieed0205/post/da070aef-2df6-4493-aabf-f14cba94cfd1/ai.PNG)
```
floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: ()=> {
          print('플로팅액션 버튼 실행')
        },
      ),
```

#### 2-5. BottomNavigationBar
![](https://images.velog.io/images/ieed0205/post/f9b912e6-3118-4296-b829-987c3b9fa8fe/fol.PNG)
```
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
```

### 3. 소스코드
```
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
        title: Text("01.Scaffold tutorial"),
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
        color: Colors.red[200],
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
```


#### 기억보단 기록하자! LEE'Today로!
