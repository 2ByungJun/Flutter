#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=QqyV_t5eKzc&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=4)

### 1. UI
![](https://images.velog.io/images/ieed0205/post/ce6eb35a-a570-413a-aae4-144b12772c43/%EC%BA%A1%EC%B2%98.PNG)

### 2. Container

#### 2-1. Position
기본적으로 위치 및 크기, 너비, 간격, 정렬 등이 있네요!
```
body: Container(
        width: 100.0,
        height: 100.0,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        alignment: Alignment.center,
```

#### 2-2. BoxDecoration
> **주의!**
> Container의 Color 기본 속성과 사용하지 못합니다!
> 
>
```
        // color: Colors.red[200], <- 못써요!
        decoration: BoxDecoration(
```
> ![](https://images.velog.io/images/ieed0205/post/e8a1e659-aa6e-4c57-ad57-9eef7d437efe/error.PNG)

이미지를 불러와 적용시킬 수 있으며, 둥근 형태로도 표현이 가능합니다.

```
decoration: BoxDecoration(
          color:Colors.red,
          image:DecorationImage(
            image: NetworkImage("http://")
          ),
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50),
       	  // boxShadow
        ),
```

#### 2-3. boxShadow
![](https://images.velog.io/images/ieed0205/post/9bb9d243-6ae0-49c6-a7a6-7119be79130f/121.PNG)
그림자들이 동시에 생기면서 그라데이션 효과를 줄 수도 있겠군요!
```
// <List> boxShadow
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5)
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(3, 3)
            )
          ]
```


  

### 3. 소스코드
```
// <widget>:body, <class>:Container
      // 배경
      body: Container(
        width: 100.0,
        height: 100.0,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        alignment: Alignment.center,
        // color: Colors.red[200], <- 못써요!
        decoration: BoxDecoration(
          color:Colors.red,
          image:DecorationImage(
            image: NetworkImage("http://")
          ),
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50),
          // <List> boxShadow
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5)
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(3, 3)
            )
          ]
        ),

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


#### 기억보단 기록하자! LEE'Today로!