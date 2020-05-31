#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=QqyV_t5eKzc&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=4)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/e3aafbaa-929b-49af-8f35-4bf81fef87c8/111.PNG)

---

### 2. Text

#### 2-1. child, children
flutter의 기능 중 child와 children이 있는데요!
* child : 기본적으로 1:1로 하나의 위젯을 가질 수 있죠!
* children : 기본 리스트 형태로 여러 위젯들을 보여줄 수 있습니다!

여기서 Text를 두 개 출력하고 싶은데... 어떻게 할까요?
Row와 Column이 있습니다.
차이를 보여드리죠!

#### 2-2. Row
Row는 기본적으로 수평적으로 결과를 보여줍니다.
![](https://images.velog.io/images/ieed0205/post/ceeedba5-99f3-44b6-b305-ae3369716525/512.PNG)

```
child: Row(
             children: <Widget>[
               Text(
                "${(1+1).toString()}. 텍스트 위젯",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )
                ),
               const Text.rich(
                 TextSpan(
                   text: 'Hello', // default text style
                   children: <TextSpan>[
                     TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                     TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],
                 ),
               )
             ],
           ),
```

#### 2-3. Column
Column은 기본적으로 수직적으로 화면을 보여줍니다!
![](https://images.velog.io/images/ieed0205/post/7321cc43-91d0-471a-a76e-e0e8a9c0d8d2/2141.PNG)
```
child: Column(
             children: <Widget>[
               Text(
                "${(1+1).toString()}. 텍스트 위젯",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                )
                ),
               const Text.rich(
                 TextSpan(
                   text: 'Hello', style: TextStyle(fontSize: 40.0), // default text style
                   children: <TextSpan>[
                     TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                     TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],
                 ),
               )
             ],
           ),
```

#### 2-4. Text Widget
Text위젯은 우리는 기본적으로 폰트를 사용하기도 하고,
style로 대부분 변경을 주게 됩니다.

![](https://images.velog.io/images/ieed0205/post/63f84131-0d7e-4e32-8729-db2cc503e31f/555.PNG)
```
Text(
                "${(1+1).toString()}. 텍스트 위젯",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                )
                ),
```

![](https://images.velog.io/images/ieed0205/post/b75d03b1-23cd-49c8-9d66-ba85610c0db4/44444.PNG)
```
const Text.rich(
                 TextSpan(
                   text: 'Hello', style: TextStyle(fontSize: 40.0), // default text style
                   children: <TextSpan>[
                     TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                     TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],
                 ),
               )
```

---

### 3. 소스코드
```
// <widget>:body, <class>:Container
      // 배경
      body: Container(
           child: Column(
             children: <Widget>[
               Text(
                "${(1+1).toString()}. 텍스트 위젯",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                )
                ),
               const Text.rich(
                 TextSpan(
                   text: 'Hello', style: TextStyle(fontSize: 40.0), // default text style
                   children: <TextSpan>[
                     TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                     TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                   ],
                 ),
               )
             ],
           ),
      ),
```


#### 기억보단 기록하자! LEE'Today로!