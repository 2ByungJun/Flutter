import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pkidscoures/TeacherView/PageManager.dart';

class CarSubView extends StatefulWidget{

  @override
  _CarSubViewState createState() => _CarSubViewState();
}

class _CarSubViewState extends State<CarSubView> {
  final _url = PageManagerView.url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("FCM 히스토리",style: TextStyle(fontSize: 40.0),)),
    );
  }
}