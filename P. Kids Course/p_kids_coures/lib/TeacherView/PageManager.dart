import 'dart:ui';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pkidscoures/LoginView/loginView.dart';
import 'Attend/AttendView.dart';
import 'CarCourse/CarCourse.dart';
import 'CarSub/CarSub.dart';

class PageManagerView extends StatefulWidget{
  /// 공통 URL
  static var url = "http://192.168.123.104:3000";
  @override
  _PageManagerViewState createState() => _PageManagerViewState();
}

class _PageManagerViewState extends State<PageManagerView> {
  int currentPage = 1;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("키즈코스",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.vpn_key,
                color: Colors.deepOrange,
              ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()), (route) => false);
              },
            )
          ],
        ),

        body: Center(
          child: Container(
            child: _getPage(currentPage)
          ),
        ),

        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
                iconData: Icons.people,
                title: "출결확인"
            ),
            TabData(
                iconData: Icons.map,
                title: "코스작성"
            ),
            TabData(
                iconData: Icons.directions_bus,
                title: "도착알림"
            )
          ],
          initialSelection: 1,
          inactiveIconColor: Colors.deepOrange,
          circleColor:  Color(0xFF72E389),
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        )
    );
  }
}

_getPage(int page) {
  switch (page) {
  case 0:
  return AttendView();
  case 1:
      return CarCourseView();
    default:
      return CarSubView();
  }
}
