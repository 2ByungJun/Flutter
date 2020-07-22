import 'package:flutter/material.dart';
import 'package:pkidscoures/LoginView/loginView.dart';

import 'Attend.dart';
import 'CarCourse.dart';
import 'CarSub.dart';

class PageManagerView extends StatefulWidget {
  @override
  _PageManagerViewState createState() => _PageManagerViewState();
}

class _PageManagerViewState extends State<PageManagerView> {
  var _index = 0;

  var _pages = [
    AttendView(),
    CarCourseView(),
    CarSubView(),
  ];

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
          appBar: AppBar(
            title: Text(
              "이병준님 상세정보",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.green[400],
          ),
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
                      border:
                          Border.all(width: 10.0, color: Colors.green[400])),
                  child: ClipOval(
                    child: Image.asset("images/logo.gif", fit: BoxFit.cover),
                  )),

              /***** ID *****/
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(width: 5, color: Colors.purple[200])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /***** 아이디 ******/
                      Row(
                        children: <Widget>[
                          Icon(Icons.account_circle, color: Colors.purple[600]),
                          Text("ID :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),),
                          Container(margin: EdgeInsets.only(left: 5),child: Text("ID",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ],
                      ),

                      /***** 이름 *****/
                      Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.purple[600]),
                          Text("이름 :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),),
                          Container(margin: EdgeInsets.only(left: 5),child: Text("이름",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ],
                      ),

                      /***** 연락처 *****/
                      Row(
                        children: <Widget>[
                          Icon(Icons.call, color: Colors.purple[600]),
                          Text("연락처 :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),),
                          Container(margin: EdgeInsets.only(left: 5),child: Text("연락처",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ],
                      ),

                      /***** 담당반 *****/
                      Row(
                        children: <Widget>[
                          Icon(Icons.menu, color: Colors.purple[600]),
                          Text("담당반 :",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),),
                          Container(margin: EdgeInsets.only(left: 5),child: Text("담당반",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ],
                      ),

                      /***** 수정버튼 *****/
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 10.0),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text("수정하기",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                          color: Colors.purple[300],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('출결확인'),
            icon: Icon(Icons.check_box),
          ),
          BottomNavigationBarItem(
            title: Text('코스작성'),
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            title: Text('차량지도'),
            icon: Icon(Icons.directions_car),
          ),
        ],
        fixedColor: Colors.deepOrange,
      ),
    );
  }
}
