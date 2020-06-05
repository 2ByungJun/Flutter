#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
* LEE'Today & 제임쓰쌤 - 2일차(2020.06.05)

> **목차**
1. Opening
2. UI
3. AppBar
4. Drawer
5. body-GridView
6. MyApp2-ListView
7. GestureDetector() vs InkWell()
8. 액션기능(1) - showSnackBar()
9. 액션기능(2) - AnimatedOpacity()
10. 마무리

---

## 1. Opening
안녕하세요! LEE'Today입니다.
오늘은 제임쓰쌤과의 수업 2일차가 되는 날입니다 :)
아무래도 전공자다보니 진행이 빠르시다고 말씀해주셨죠!

그만큼 학생 개개인에 맞춰서 가르치는 속도가 달라진다는 소리죠?!
저로선 너무 감사한 부분입니다...!
왜냐면 전 빨리 배우고 기능적인 부분을 써먹어야 하거든요 ㅎㅎ...!

자! 오늘은 제임쓰쌤이 첫 과제를 주셨습니다.
바로 오늘 개발하고있는 기본적인 화면 구성인데, 다양한 widget을 사용하죠!

> **과제**
1. 클릭 가능하게해서 만들어서 Page 3로 이동
2. -> GestureDetector(), 다른 위젯이 있는지
3. -> 추가적으로 이벤트가 있는 위젯이 있는지 || 효과 등 -> 찾아보고 적용

과제는 아마 이해가 안되실 것입니다!
바로 추가 구현이였거든요 :)
차차 설명을 통해 과제가 어느 부분인지 함께 찾아봅시다!

---

## 2. UI
* 기본 UI는 다음과 같습니다!
![](https://images.velog.io/images/ieed0205/post/e49fe154-4db4-4d06-bd99-f22c2303db1d/%EB%85%B9%ED%99%94_2020_06_06_01_05_08_552.gif)

정말 다양한 기능들이 있는 것 같죠?!
무려 제임쓰쌤과 40분 조차 안걸려서 만든 간단한 UI랍니다!
해당 UI는 Card()도 입혀서 이쁘게 만들어 본거지만 이제 개발자모드를 ON 해야합니다!
개발자스러운 화면이 뭘까요?! 이렇습니다.
* 개발자 모드?! ![](https://images.velog.io/images/ieed0205/post/a687d692-0279-46f6-85c4-6f462e4036a2/3.PNG)
흠.. 이게 뭘까 하시는 분들도 있겠지만!
항상 UI를 구성할 때 색을 입혀서 어떤식으로 작동하는지 보아야 나중에 개발할 때 틀어짐 없이 구현이 가능하다고 제임쓰 쌤이 그러셨죠!
이제 하나하나 기억을 되살려보아 뜯어봅시다 :)

---

## 3. AppBar
AppBar는 Scaffold에 보통 속해있는 가장 기본적인 상단에 있는 위젯입니다!
우리는 이걸 매우매우 많이 쓰기도 하죠 :)

* UI - AppBar
![](https://images.velog.io/images/ieed0205/post/232ce0b0-7f29-418b-995f-bba2a7886030/%EC%BA%A1%EC%B2%98.PNG)
```
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
      
drawer: Drawer(), // 왼쪽 햄버거 버튼
```
AppBar는 기본적으로 3단계 구성이라 볼 수 있습니다.

**※ 3단 구성**
![](https://images.velog.io/images/ieed0205/post/6c1d65dc-1724-4191-98ef-9c002d3ffc82/%EC%BA%A1%EC%B2%98.PNG)
* 검은부분 : Drawer() or Navigator.pop(이전)
* 보라부분 : Text
* 노란부분 : Icon

### >3-1. Drawer() or 이전
* Drawer()
![](https://images.velog.io/images/ieed0205/post/5616bde4-d5a1-4f28-b209-78db66991be3/4444.PNG)
* 이전
![](https://images.velog.io/images/ieed0205/post/f6efcef5-136f-4ddd-b1de-3d8cd86edd3d/333.PNG)

만약 UI코드에서 Drawer()를 없앤다면?!
![](https://images.velog.io/images/ieed0205/post/55750d43-0817-47a2-8245-31100d1c8b41/142.PNG)

```
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
```
여기서 centerTitle: true 속성때문에 글이 중앙정렬이 됩니다!
* 여기서 centerTitle 속성이 없다면?!![](https://images.velog.io/images/ieed0205/post/151d089a-4b52-4b79-8946-a0f22f391774/222.PNG)
음.. 좌측에 몰리게 되는군요!
기본적으로 Android는 다음과 같이 좌측으로 보이지만
IOS는 디폴트 값이 중앙 정렬이 되어있는 상태랍니다!

이제 전반적인 AppBar에 대한 속성을 알게되었습니다.

---

## 4. Drawer
* UI
![](https://images.velog.io/images/ieed0205/post/8ef6e3f3-3c81-479d-931b-718c8d2e2147/11.PNG)


* Source Code
```
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
```

Drawer()은 하나의 작은 페이지를 두었다 생각하면 될 것 같습니다!
body와 마찬가지로 Container속성에 Column값을 두어 여러가지 위젯들을 세로 방향으로 나열할 수 있죠!
* [Row와 Column 속성](https://velog.io/@ieed0205/Flutter-4-Text-Widget341)은 해당 링크에서 사용법을 확인해보세요!

---

## 5. body-GridView
이제 난이도가 살짝 급상승 하게 됩니다.
[GridView](https://velog.io/@ieed0205/Flutter-9-CustomScroll-SliverScroll1341)에 대한 설명은 해당 링크에서 확인해보세요!

GridView는 기본적으로 gridDelegate 속성이 꼭 들어가야 합니다!
* UI
![](https://images.velog.io/images/ieed0205/post/b6f7341a-fa42-4cb2-a04b-37b6a44a6c8b/12.PNG)

여기서 게시판들이 입체적으로 보이는 것은 Card 위젯으로 묶었고,
빨간 부분이 GridView형식의 Container 범위가 되는 것입니다!

* Source Code
```
body: GridView.builder(
        // 주어진 갯수 만큼, 우리가 정한 템플릿이 반복됨
        // 갯수가 0 ~ 개수-1
        // -> item들은 List형태
        padding: EdgeInsets.all(10.0),
        itemCount: 10,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,      // 격자 수
          mainAxisSpacing: 10.0,  // 주축 간격
          crossAxisSpacing: 10.0, // 교차 축 간격
          ...
          itemBuilder: (BuildContext bc, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MyApp2(),
            )),
            child: Card(
              child: Container(
                color: Colors.red,
                ...
```

* itemCount : 탬플릿으로 만들 갯수 ( 0부터 시작 )
* gridDelegate : GridView에서 필수적으로 존재해야할 속성
* itemBuilder : item들에 대한 build를 해주어 액션 및 위젯을 사용
* return **GestureDetector**  
: itemBuilder를 통해서 만들어진 리턴 값인데, 여기서 GestureDetector은 위젯에 onTap() ... 등 클릭할 수 있는 제스쳐 효과를 준다!
이후 자세히 다뤄본다!

전체 UI 영상부분에서 클릭할 시 ListView로 넘어가는 것이 다음과 같은 onTap() 효과를 준 것이다!

---

## 6. MyApp2-ListView
* UI
![](https://images.velog.io/images/ieed0205/post/639bae6d-0052-4ae8-8ede-9e744ed61b56/3333.PNG)

ListView는 기본적으로 Column속성을 가지며, weight을 전체부분으로 가진다!

GridView와 다르게 ListView는 따로 gridDelegate와 같은 강제속성은 없다!
하지만 이외에는 거의 비슷하다 볼 수 있으며 4단 구성이 기본적으로 매겨지는 ListTile이라는 좋은 기능이 있다!

* Source Code
```
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
```

### >6-1. ListTile
* UI
![](https://images.velog.io/images/ieed0205/post/6413c8c4-a00e-4a0c-a60c-08b18098dca6/aa.PNG)


* 검은 부분 : leading 속성
* 초록 부분 : title 속성
* 주황 부분 : subtitle 속성
* 빨간 부분 : trailing 속성

기본적으로 구성되어 있으며, 간단하게 보기 좋은 UI를 만들 수 있다!

---

## 7. GestureDetector() vs InkWell()

우리는 이미 GestureDetector()에 대해서는 알고 있다!
위젯에게 클릭 효과를 주는 것이다!

음.. 근데 InkWell()도 마찬가지로 클릭 효과를 주네?

무슨 차이일까?!

쉽게 생각하면 다음과 같다.
* GestureDetector() : 하위 Container에 대한 클릭 효과
* InkWell() : 상위 Container에 대한 클릭 효과

우리는 해당 소스코드를 묶을 예정이다!
```
child: Container(
           width: 70.0,
           height: 70.0,
           decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(70.0),
             image: DecorationImage(
                   image: NetworkImage("https://cdn.pixabay.com/photo/2020/06/01/07/16/pieris-rapae-5245438__340.jpg"
                   ),
                   fit: BoxFit.cover 
             )
           ),                   
         ),
        ),
```
묶기 위해선 Container앞에 'Alt+Enter'를 눌러서 상단 위젯을 만들 수 있고!
우린 GestureDetector와 InkWell를 둘 중에 선택한다!

### >7-1. GestureDetector()

GestureDetector()로 묶은다면 안에 다양한 [클릭 속성](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)들이 있다!
속성들은 링크를 따라가서 확인해보자!

여기서는 onTap(){} 을 사용하게 될텐데! 범위는 어떨까?
![](https://images.velog.io/images/ieed0205/post/a0b296f5-1c7f-4b6b-8a3d-71d2ae380c33/13.PNG)
정확히 이미지를 지운 UI인데, 분홍 부분을 정확히 클릭해야 작동한다!
파란색 부분을 클릭한다면, 기존에 전체적으로 onTap()인 MyApp2 ListView로 이동하게 된다.

* 결론은 하위 Container에서만 클릭되게 해준다.
![](https://images.velog.io/images/ieed0205/post/cb3de054-6469-41a1-ace0-02b5596a7f32/1.PNG)


### >7-1. InkWell()
그럼 반대로 InkWell()는?

* 상위 Container범위까지 클릭이 가능하게 해준다!
![](https://images.velog.io/images/ieed0205/post/1d2f7233-585f-4ac4-a8d7-4999dc8f326f/2.PNG)

* UI에서 보면 파란부분이 상위 Container이므로, 클릭하면 InkWell()의 onTap(){} 이벤트가 발생하게 된다.

* Source Code
```
Container(
           color: Colors.blue,
           child: InkWell(
              onTap: () {},
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
                ),
            ),
         ),
```
* GestureDetector()는 InkWell() 부분에 들어가면 동일하다.

---

## 8. 액션기능(1) - showSnackBar()
이제 드디어 과제이다!
> **과제**
1. 클릭 가능하게해서 만들어서 Page 3로 이동
2. -> GestureDetector(), 다른 위젯이 있는지
3. -> 추가적으로 이벤트가 있는 위젯이 있는지 || 효과 등 -> 찾아보고 적용

1번의 Navigator.push 기능은 누구나 클릭효과를 주어 발생시킬 수있다 생각하여 생략한다!
그래도 혹시모르니 [Navigator.push](https://velog.io/@ieed0205/Flutter-7-Navigator1141) 링크를 걸어두자!

2번 기능도 우린 벌써 해결했다!
바로 InkWell() 위젯이다.
GestureDetector()와 다른 점은?
바로 Container가 상위냐? 하위냐? 의 차이이다!

마지막 3번!
Flutter의 꽃은 애니메이션이라 해도 과언이 아니라고 생각한다.
나 역시도 애니메이션에 꽃혀서 Flutter를 시작했기 때문이다 허허...

여기서 내가 알아본 기능으로는
* showSnackBar
* AnimatedOpacity

인데, 먼저 showSnackBar()를 알아보도록 해보자!

* UI
![](https://images.velog.io/images/ieed0205/post/0dd555d3-acbe-49e6-9e9d-eaebb2497df9/444.PNG)

이미지의 파란범위를 클릭한다면 생기는 이벤트이다.
왜 파란 범위인지는 InkWell() 위젯 설명을 다시 가자!

* Source Code
```
  // 3-(1). showSnackBar, Scaffold 용 글로벌 키 발급
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      // 3-(1). showSnackBar, 발급한 키를 Scaffold 에 등록
      key: scaffoldKey, 
      ...
      
      child: InkWell(
             onTap: () {
              setState(() {
                 // 3-(1). showSnackBar 기능
                 scaffoldKey.currentState.showSnackBar(
                 SnackBar(content: Text("InkWell Tap!"))
                 );
                 });
            }
           ),
```

* 기본적으로는 Scaffold.of(context)를 사용하게 되는데, 우리의 InkWell(onTap(){};), 기능은 body부분에서도 매우 깊이 있다.
그래서 Scaffold의 Scaffold를 참조하게 되어 에러가 발생하게 된다.

너무 어렵다구요!?

그렇담 정리해드리죠!
**
1. Scaffold에서도 Key라는 속성이 있는데 여기서 
2. scaffoldkey를 따로 GlobalKey로 가져와서 
3. Scaffold에 속해있지만 깊이 있어도 scaffoldKey.currentState를 이용해서 
4. 스낵바를 출력할 수 있게 됩니다!
**
그래도 이해가 어렵다면 [링크:showSnackBar](https://here4you.tistory.com/154)를 걸어두겠습니다!

---
  
## 9. 액션기능(2) - AnimatedOpacity()

두번째 기능으로는 AnimatedOpacity()를 골랐습니다!
클릭하면 서서히 투명상태였던 위젯이 본 모습으로 변경되는 액션이죠!

* UI
![](https://images.velog.io/images/ieed0205/post/b2651d7f-9035-4358-b8ee-2d82f34d0e5e/%EB%85%B9%ED%99%94_2020_06_06_02_34_09_798.gif)

* Source Code
```
  // 3-(2). Optical Animation
  double opacityLevel = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    ...
    Container(
        color: Colors.blue,
        
        child: AnimatedOpacity(
           duration: Duration(seconds: 1),
           opacity: opacityLevel,
           
            child: InkWell(
              onTap: () {
              setState(() {
                // 3-(2). AnimatedOpacity 기능
                opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                 });
            }
           ),
       ),
  ),
```
* AnimatedOpacity() : 투명도 조절 위젯
* duration: Duration(seconds: 1) : 필수 속성(시간값)
* opacity: opacityLevel(dobule형),
* opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
: 클릭시, opacityLevel이 0일때, True이면 투명도가 없게되고, False면 투명해진다.

즉, 우리가 처음으로 1.0을 설정했기 때문에 0이 아니므로 0.0으로 변화해가는 과정을 Duration(시간값)으로 딜레이 시키는 과정이다!

우린 이 모습을 투명해지는 액션효과로 볼 수 있게된다!

---

## 10. 마무리
오늘부터 열심히 탐구하는 개발자가 되어야겠다는 생각을 했죠...
밤을 안새면 그만큼 뒤쳐지는 것이고, 다른 것은 계속 밀린다고 느낍니다!

그래도 할 수 있는 만큼 최선을 다한다면 언젠가 보답이 오지 않을까요?!

복습만 3시간 분량으로 작성하니 ㅠㅠ
효율적인 공부법인지 모르겠지만 꼭 얻어가시는 분들이 있길 바라며...

이만 오늘은 끝!

---
  
#### 기억보단 기록하자! LEE'Today로!