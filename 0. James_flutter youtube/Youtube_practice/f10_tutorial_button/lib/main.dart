import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'My app', // used by the OS task switcher
  home: MyScaffold(),
));

class MyScaffold extends StatelessWidget {
  List<bool> isSelected = [false, false, true];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바
      appBar: AppBar(
        title: Text("10.Button tutorial"),
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

  void setState(Null Function() param0) {}
}