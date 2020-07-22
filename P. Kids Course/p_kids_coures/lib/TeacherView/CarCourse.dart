import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarCourseView extends StatefulWidget {
  @override
  _CarCourseViewState createState() => _CarCourseViewState();
}

class _CarCourseViewState extends State<CarCourseView> {
  var _isCheck = false; // 등&하원 스위치

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            /***** 등&하원 스위치 *****/
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: <Widget>[
                  Text("등원",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepOrange),),
                  Switch(
                    value: _isCheck,
                    onChanged: (value){
                      setState(() {
                        _isCheck = value;
                      });
                    },
                  ),
                  Text("하원",style : TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo),)
                ],
              ),
            ),

            /***** 주소지 ListView *****/
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(width: 5, color: Colors.orange[200])),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(width: 5, color: Colors.red[200])),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(width: 5, color: Colors.blue[200])),
                    ),
                  ),
                ],
              ),
            ),

            /***** 선택된 주소지 *****/
            Container(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.purple[300])),
              child: Text(
                "선택된 주소지",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(width: 5, color: Colors.purple[300])),),
            ),

            /***** 등록할 아이들 *****/
            Container(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.green[300])),
              child: Text(
                "등록할 아이들",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(width: 5, color: Colors.green[300])),),
            ),

          ],
        ),
      ),

      /***** 주소지 추가 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text("주소지 추가"),
        icon: Icon(Icons.map),
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}
