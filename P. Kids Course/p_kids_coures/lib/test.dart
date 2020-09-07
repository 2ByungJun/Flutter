import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'LoginView/loginView.dart';
import 'TeacherView/Attend/AttendView.dart';
import 'TeacherView/CarCourse/CarCourse.dart';
import 'TeacherView/CarSub/CarSub.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "출결확인"
          ),
          TabData(
              iconData: Icons.search,
              title: "코스작성"
          ),
          TabData(
              iconData: Icons.shopping_cart,
              title: "차량지도"
          )
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      )
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return AttendView();
      case 1:
        return CarSubView();
      default:
        return LoginView();
    }
  }
}