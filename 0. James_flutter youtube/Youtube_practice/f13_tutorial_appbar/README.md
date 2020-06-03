#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=QX35_kkYW0M&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=15)

---

### 1. UI
* List
![](https://images.velog.io/images/ieed0205/post/8d9c5cb1-35a3-4864-95d5-8deb8f48e984/list.PNG)
* Grid
![](https://images.velog.io/images/ieed0205/post/0012a176-d647-4319-aa73-38240c67b8ce/grid.PNG)

---

### 2. CustomScroll & SliverScroll
CustomScroll & SliverScroll을 사용하게 되면 특이한 Appbar와 레이아웃에 따라 보여지는게 달라지게 됩니다!

#### 2-1. List

```
Scaffold(
      body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text("13. CustomScroll & SliverScroll(List)"),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, int index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                            child: Text("List Item $index"),
                          ),
                      childCount: 20)),
            ],
          ),
      );
```


#### 2-2. Grid

```
Scaffold(
        body : CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("13. CustomScroll & SliverScroll(Grid)"),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              delegate: SliverChildBuilderDelegate(
                      (context,int index) => Container(
                    child: Center(
                      child: Text("Item $index"),
                    ),
                  ),
                  childCount: 20
              ),
            )
          ],
        ), 
      );
```

#### 2-3. bottomNavigationBar
bottomNavigationBar의 네비게이터 구현을 하고 싶었지만, 미흡한 탓에 구현하지는 못하였습니다 ㅠㅠ..
혹시나 구현하시게 된다면 기본 툴을 참조하여 공부해보세요!

```
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ListTap(),
    GridTap(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
...

bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("List")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_on),
              title: Text("Grid")
          ),
        ],
      ),
```

---

### 3. 소스코드
```

이번 소스코드는 정확하지 않아 생략하겠습니다 :)

```


#### 기억보단 기록하자! LEE'Today로!