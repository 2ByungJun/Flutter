import 'package:flutter/material.dart';
import 'package:pkidscoures/LoginView/loginView.dart';
import 'package:pkidscoures/SideBar/navigation_bloc.dart';

import 'Attend/AttendView.dart';
import 'CarCourse/CarCourse.dart';
import 'CarSub/CarSub.dart';

class PageManagerView extends StatefulWidget with NavigationStates{
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            margin: EdgeInsets.only(top: 50.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _pages[_index]
        ),
      ),
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
