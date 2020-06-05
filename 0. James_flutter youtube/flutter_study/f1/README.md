#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
* LEE'Today & 제임쓰쌤 - 1일차(2020.06.04)

> **목차**
1. Opening
2. Stateful은 stack이지!
3. Stateful Widget Lifecycle(생명주기)\

---

## 1. Opening
안녕하세요! LEE'Today 입니다 :)
드디어 첫 대면 수업의 당일입니다.
이때까지만해도 많이 불안했었습니다... 졸작 할 수 있는거니...?
하지만 걱정이 무산되게 Flutter의 매력을 제대로 알게 해준 제임쓰쌤에게 너무 감사드립니다!
매우 수업이 깊이있고 재미있었거든요!

제목은 제가 이날 가장 인상깊은 내용으로 정해보았는데
와... 정말 읽기 싫어지는 이름이죠?
'생명주기'... 뭔 소리일까요?
일단 flutter를 하기 위해 가장 먼저 알아야 할! 꼭 알아야 할! 이론이라고 해두죠.
속는셈 치고 ㅎㅎ... 읽어보아요!
![](https://images.velog.io/images/ieed0205/post/992a0eaa-58ca-4d69-9d81-ed9d7d365517/externalFile.jpg)

---

## 2. Stateful은 stack이지!

Flutter를 시작하면 가장 먼저 쫘잔! 하고 있는 두 개의 State객체가 있죠.
> State(상태)
: 맞습니다. 상태를 다루는 객체들입니다.
>
> 어렵게 특징을 말씀드리면?
>
1. 위젯이 사용하는 데이터는 변경 될 수 있다.
2. 위젯이 빌드 될때 데이터를 동시에(synchronously) 읽을 수 없다. (모든 state는 build 메서드가 호출 될때 까지 설정 되어야 한다.)

간단하게 두 가지가 있습니다!
우린 명령어로 'st'만 쳐도 'stless, stful'이라는 오버라이딩, 즉 자동생성 기능이 있습니다. 매우 편리하죠!
* Stateless : 상태가 없는 위젯?
* Stateful : 상태가 있는 위젯?

와우 어렵습니다...!
쉽게 말하면 Stateless는 보여주기만 하는 거고,
Stateful은 여러가지 액션 즉, 상태들을 변화시켜주는 애니메이션 느낌이겠군요?

### 2-1. Statefull은 stack 구조!
![](https://images.velog.io/images/ieed0205/post/cdea0d78-12c9-4e3d-b5bf-7ec2a33a714a/asfa.PNG)
이후 다룰 라이플 사이클에서 메서드들을 파악할건데요!

**우리가 페이지를 만들다보면 전 페이지를 '이전' 버튼으로 돌아갈 수 있을 것입니다.**

이때! 돌아갈 수 있는 것은 Stack 구조이기 때문입니다.
하지만 이 스택에 8개까지 담기거나 이후 넘어가면 무수한 build()이 생기며 **시간이 점점 오래 걸리게 되는 구조**입니다.

몰론 종료는 stack구조에 맞게 Page3부터 종료되겠죠?
차차 알아가봅시다!

### 2-2. 라이프 사이클은 다음과 같죠!
* 라이프 사이클이 뭐죠?
: 음... 일종의 순서(로직)이라고 보시면 된답니다.
![](https://images.velog.io/images/ieed0205/post/58506754-27b1-4423-b62f-6eb8b7281e40/%EC%BA%A1%EC%B2%98.PNG)

Stateless는 말그대로 보여주기만 하는 build()로 넘어가죠?
근데 여기서 Stateless가 상태를 가지지 않는다라는 영어직해가 되어있죠?...
**사실 아니라는 것!**

Stateless는 사실 내부적으로 상태를 가집니다.
하지만 왜 less를 쓸까요?
왜냐하면 변경할 수 없는 상태를 가지는 Widget이기 때문이죠.
State는 Immutable(불변의) 하다고 할 수 있다고 합니다.

반대로 Stateful은 (mutable(변경가능한)) Widget이겠죠!
그럼 이제 복잡하기도 한 Stateful로 넘어가보죠!

---

## 3. Stateful Widget Lifecycle(생명주기)

### 3-1. 첫 시작 main() => runApp()
아참! 시작전에 설명드릴 것이 있습니다.

```
void main() => runApp(MaterialApp(
      home: MyApp(),
    ));
```
우리는 이 코드를 건드리시면 안됩니다.
기본적으로 runApp의 객체에서 모든 것을 수행할 수 있고,
MaterialApp 디자인을 사용하게 됩니다.

**※ 왠만하면 runApp은 안건들이는 것을 추천하고 진행하세요!**

* runApp 객체 안에 MaterialApp이 있는것이죠!

> 어? 우리는 이렇게 안되어있는데요??...
```
void main() => runApp(MyApp);
```
이렇게 되있으시겠죠?
주로 Stateless로 MyApp이 넘어가게되는데, 그 이유는
MaterialApp 디자인을 쓰기 위함입니다.
고로 맨 위의 코드는 Stateless단계를 생략되었지만 적용됨을 알 수 있습니다. ( 코드 압축이죠! )

### 3-2. Stateful
이제 Stateful로 넘어오실 수 있습니다.
```
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // <~ Scaffold로 바꿔주세요!
    );
  }
}
```
이 코드에 그럼 MaterialApp에 대한 페이지가 어떻게 적용될까요?
![](https://images.velog.io/images/ieed0205/post/8473ea3a-b938-4e0f-bca5-89facb61b945/aa.PNG)
다음과 같이 구성되고 순차적으로...
	1. MaterialApp 페이지 생성
    2. Scaffold 적용
    3. Scaffold에 있는 위젯들 생성!
    
감이 오시겠죠?!
이제 Lifecycle을 익힐 준비가 되었습니다!

![](https://images.velog.io/images/ieed0205/post/36a8b3ba-abbb-4ae7-a2dd-c648cdda44c2/1.PNG)

Stateful의 Lifecycle 구조입니다.
이제 코드들을 보실텐데요.
```
class _MyApp5State extends State<MyApp5> {
  
  @override
  void initState() {              <- initState
    // TODO: implement initState
    super.initState();
  }
  
  @override
  void didChangeDependencies() {  <- didChange...
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) { <- build
    return Scaffold(
      body: Container(
        child: RaisedButton(
          onPressed: (){
            setState(() {          <- setState
              
            });
          },
        ),
      ),
    );
  }
}
```

### 3-3. Lifecycle
#### (1) initState()
위젯이 생성될때 처음으로 호출되는 메서드입니다!
몰론 stateful에 해당하는 class 다음에 말이죠 :)
initState는 오직 한번 만 호출 되는데 반드시 super.initState()를 호출해야합니다.

주로
1. 생성된 위젯 인스턴스의 BuildContext에 의존적인 것들의 데이터 초기화
2. 동일 위젯트리내에 부모위젯에 의존하는 속성 초기화
3. Stream 구독, 알림변경, 또는 위젯의 데이터를 변경할 수 있는 다른 객체 핸들링.
이용하게 됩니다!

#### (2) didChangeDependencies()
didChangeDependencies 메서드는 위젯이 최초 생성될 때 initState() 다음에 호출 됩니다.
또한 위젯이 의존하는 데이터의 객체가 호출될때마다 호출되죠!
예를 들면, 업데이트 되는 위젯을 상속한 경우 상속한 위젯이 업데이트 될 때 네트워크 호출이 필요한 경우 사용하게 됩니다.

#### (3) build()
build 메서드는 한번 호출될까요? 전혀 아닙니다!
자주 호출되죠!
왜냐하면 버튼을 누르거나 액션을 할 경우마다 호출되거든요 :)
또한 반드시 Widget을 리턴해야합니다. 해당 코드에선 Scaffold군요!

#### (4) setState()
setState 메서드는 개발자로 부터 매우 자주 호출됩니다.
아까 라이프 사이클에서 build에서 setState로 가면 다시 build 전으로 되돌아가죠?
우린 여기 build에서 계속되는 액션을 수행하게 됩니다.
'데이터가 변경되었음'을 프레임워크에 알리는데 사용하고,
주로 비동기적이지 않은 callback에서 사용된다네요!

#### (5) dispose()
dispose는 State객체가 영구적으로 제거 된다는 뜻입니다.
즉 더이상 build 되지 않는 화면인거죠!
![](https://images.velog.io/images/ieed0205/post/ac59fd32-8211-488b-8616-39ff96179ffc/444.PNG)

#### 기억보단 기록하자! LEE'Today로!
