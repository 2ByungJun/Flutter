import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarSubView extends StatefulWidget {
  @override
  _CarSubViewState createState() => _CarSubViewState();
}

class _CarSubViewState extends State<CarSubView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              /***** 차량 코스 *****/
              Container(
                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(width: 3, color: Colors.deepOrange[300])),
                child: Text(
                  "차량 코스",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,
                      color: Colors.black),
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

              /***** 하차 처리 *****/
              Container(
                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(width: 3, color: Colors.deepOrange[300])),
                child: Text(
                  "하차 처리",
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
                      border: Border.all(width: 5, color: Colors.deepOrange[300])),),
              ),

              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("도착 처리",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                  color: Colors.purple[300],
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text("도착 5분 전에 눌러주세요!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),),

                    Text("부모님께 알림메세지가 도착하게 됩니다.",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
