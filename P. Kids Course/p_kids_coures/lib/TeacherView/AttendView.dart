import 'package:flutter/material.dart';
import 'package:pkidscoures/LoginView/loginView.dart';

class AttendView extends StatefulWidget {
  @override
  _AttendViewState createState() => _AttendViewState();
}

class _AttendViewState extends State<AttendView> {
  String _value;

  /***** bottomNavigationBar *****/
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "키즈코스",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange[300],
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.vpn_key),
              tooltip: "로그아웃",
              onPressed: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginView()),
                        (route) => false)
              })
        ],
      ),

      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(title: Text("이병준님 상세정보"),),
          body: Column(
            children: <Widget>[
              /***** 이미지 *****/
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 10.0, color: Colors.orange[300])),
                  child: ClipOval(
                    child: Image.asset("images/logo.gif", fit: BoxFit.cover),
                  )),

              /***** ID *****/
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.orange[200],
                    child: Icon(Icons.account_circle),
                  ),

                  Container(
                    color: Colors.blue[200],
                    child: Text("ID"),
                  )
                ],
              ),

              /***** 이름 *****/
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.orange[200],
                    child: Icon(Icons.account_circle),
                  ),

                  Container(
                    color: Colors.blue[200],
                    child: Text("이름"),
                  )
                ],
              ),

              /***** 연락처 *****/
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.orange[200],
                    child: Icon(Icons.account_circle),
                  ),

                  Container(
                    color: Colors.blue[200],
                    child: Text("연락처"),
                  )
                ],
              ),

              /***** 소속반 *****/
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.orange[200],
                    child: Icon(Icons.account_circle),
                  ),

                  Container(
                    color: Colors.blue[200],
                    child: Text("소속반"),
                  )
                ],
              ),

              /***** 수정버튼 *****/
              RaisedButton(
                onPressed: (){},
                child: Text("수정하기"),
              )
            ],
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0 ),
            child: Column(
              children: <Widget>[
                Text("반을 선택하세요!"),

                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('달님반'),
                      value: 'one',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('햇님반'),
                      value: 'two',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('별님반'),
                      value: 'three',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  hint: Text('반 선택하기'),
                  value: _value,
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                Text("[달님반]"),
                DataTable(

                  columns: [
                    DataColumn(label: Text("아름")),
                    DataColumn(label: Text("출결상태")),
                    DataColumn(label: Text("상태"))
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('아이1')),
                        DataCell(Checkbox(
                          value: true,
                          onChanged: (bool value) {},
                        )),
                        DataCell(Text('등원완료'))
                      ]
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
                Text('출석한 아이들'),
                Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 10.0, color: Colors.orange[300])),
                )
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('출결확인'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('차량코스'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('차량지도'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
