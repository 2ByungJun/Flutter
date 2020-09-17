import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../PageManager.dart';
import 'CarCourseCreate.dart';

class CarCourseView extends StatefulWidget {
  @override
  _CarCourseViewState createState() => _CarCourseViewState();
}

class _CarCourseViewState extends State<CarCourseView> {
  final _url = PageManagerView.url;

  List carList = [];
  List<String> titles;
  List<Widget> images;

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/course");
    List<dynamic> _resBody = json.decode(_res.body);
    return _resBody;
  }

  @override
  void initState() {
    Future.microtask(() async {
      carList = await this.fetch();
      titles = new List<String>(carList.length);
      images = new List<Widget>(carList.length);

      /// 데이터 셋팅
      for(int i=0; i<carList.length; i++){
        titles[i] = carList[i]['fields']['Name'];
        images[i] = Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/car.PNG"), fit: BoxFit.cover),
              ),
            ));
        print(titles[i]);
      }

      setState(() {});
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.fetch(),
          builder: (BuildContext context, AsyncSnapshot<List> snap) {
            if (!snap.hasData) return Scaffold(body: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange))));

            return SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: VerticalCardPager(
                        textStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                        titles: titles,
                        images: images,
                        onPageChanged: (page) {
                          // print(page);
                        },
                        align: ALIGN.CENTER,
                        onSelectedItem: (selectIndex) async {
                          http.Response _resBaby = await http.post(_url + '/courseBaby',body: {
                            'idx' : (selectIndex+1).toString()
                          });
                          List<dynamic> _babyData = json.decode(_resBaby.body);
                          print(_babyData);


                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height/12,
                                          alignment: Alignment(0.0, 0.0),
                                          child: Text(snap.data[selectIndex]['fields']['Name'] + "\t상세화면",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                        ),
                                      ),

                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height/15,
                                        alignment: Alignment(0.0, 0.0),
                                        child: Text('도착지 : ' + snap.data[selectIndex]['fields']['Address'],style: TextStyle(fontSize: 17.0),),
                                      ),

                                      SizedBox(
                                        height: 20.0,
                                      ),

                                      Text('하원하는 아이들 명단', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),

                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height/6,
                                        child: ListView.builder(
                                          itemCount: _babyData.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index){
                                            return Container(
                                                width: 150.0,
                                                height: 150.0,
                                                margin: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  color: Colors.deepOrangeAccent
                                                ),
                                                child: Center(child: Text(_babyData[index].toString(), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),))
                                            );
                                          },
                                        ),
                                      ),

                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height/10,
                                        alignment: Alignment(0.0, 0.0),
                                        child: CupertinoButton(
                                          child: Text("도착 메세지 보내기", style: TextStyle(fontWeight: FontWeight.bold),),
                                          color: Colors.orangeAccent,
                                          onPressed: (){
                                            /// 도착메세지 FCM
                                          },
                                        )
                                      ),

                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

      /***** 주소지 추가 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarCourseCreate()));
          setState(() {});
        },
        label: Text(
          "코스추가",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.map),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

