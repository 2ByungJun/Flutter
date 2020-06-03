#### 오늘 하루엔 뭐했니?
#### 그냥 적어봐! LEE렇게!
___
참고 : [제임쓰flutter 유튜브](https://www.youtube.com/watch?v=g1CYX0ipZ7k&list=PLIKnSA4GMR4NXpNdCtJOL0BhWcxX_BBHJ&index=12)

---

### 1. UI
![](https://images.velog.io/images/ieed0205/post/3c46c464-0fce-4139-8fb1-bc30f55823bd/%EB%85%B9%ED%99%94_2020_06_03_15_34_25_486.gif)

---

### 2. Button
버튼은 보통 네비게이션 역할이나 특수한 효과를 장식하죠!
다양한 버튼들을 소개해드리겠습니다!

* RaisedButton
* BackButton
* CloseButton
* FloatingActionButton
* OutlineButton
* RawMaterialButton
* ToggleButtons
* CupertinoButton
* PopupMenuButton
* DropdownButton
* MaterialButton
* InkWell
* GestureDetector
* FlatButton
* IconButton

하단의 소스코드들을 참고해주세요 :)

---

### 3. 소스코드
```
// <widget>:body, <class>:Container
      // 배경
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("RaisedButton"),
                  onPressed: (){},
                ),
                BackButton(),
                CloseButton(),
                FloatingActionButton(
                  child: Icon(Icons.check),
                  onPressed: (){},
                ),
                OutlineButton(
                  child: Text("OutlineButton"),
                  onPressed: (){},
                ),
                RawMaterialButton(
                  child: Text("RawMaterialButton"),
                  onPressed: (){},
                ),
                ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.favorite),
                  ],
                  onPressed: (int index){
                    setState(() {
                      for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++){
                        if(buttonIndex==index){
                          isSelected[buttonIndex] = true;
                          } else {
                          isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                  isSelected: isSelected,
                ),
                CupertinoButton(
                  child: Text("CupertinoButton"),
                  onPressed: (){},
                ),
                PopupMenuButton(
                  child: Text("POP"),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("PopupMenuItem1"),
                      value: "PopupMenuItem",
                    ),
                    PopupMenuItem(
                      child: Text("PopupMenuItem2"),
                      value: "PopupMenuItem",
                    ),
                  ],
                ),
                DropdownButton(
                  hint: Text("DropdownButton"),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("1"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("2"),
                    ),
                  ],
                  onChanged: (int value){},
                ),
                MaterialButton(
                  child: Text("MaterialButton"),
                  onPressed: (){},
                ),
                InkWell(
                  child: Text("InkWell"),
                  onTap: (){},
                ),
                GestureDetector(
                  child: Text("GestureDetector"),
                  onTap: (){},
                ),
                FlatButton(
                  child: Text("FlatButton"),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.check_circle),
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
      ),
```


#### 기억보단 기록하자! LEE'Today로!