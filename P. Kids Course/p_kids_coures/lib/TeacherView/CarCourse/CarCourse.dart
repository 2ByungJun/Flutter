import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:vibration/vibration.dart';

import '../PageManager.dart';
import 'CarCourseCreate.dart';

class CarCourseView extends StatefulWidget {
  @override
  _CarCourseViewState createState() => _CarCourseViewState();
}

class _CarCourseViewState extends State<CarCourseView> {
  final _url = PageManagerView.url;

  List carList = [];
  List<String> titles = new List<String>(50);
  List<String> address = new List<String>(50);
  List<String> id = new List<String>(50);
  List<Widget> images = new List<Widget>(50);

  String _homeScreenText = "토큰 메세지";
  String _messageText = "대기 메세지";
  String result = "결과";
  var tokenId = "";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<List> fetch() async {
    http.Response _res = await http.get(_url + "/course");
    return json.decode(_res.body);
  }

  @override
  void initState() {
    Future.microtask(() async{
      carList = await this.fetch();
      setState(() {});
      print(carList);
    });

    firebaseCloudMessaging_Listeners();
    super.initState();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((String token) {
      print('token:' + token);
      tokenId = token;
    });

    _firebaseMessaging.configure(
      /** 앱이 실행중인 경우 **/
      onMessage: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onMessage: $message");
      },

      /** 앱이 완전히 종료된 경우 **/
      onLaunch: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onLaunch: $message");
      },

      /** 앱이 닫혀있지만 백그라운드로 동작중인 경우 **/
      onResume: (Map<String, dynamic> message) async {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        setState(() {
          _messageText = "Push Messaging message: $message";
        });
        print("onResume: $message");
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true)
    );

    _firebaseMessaging.onIosSettingsRegistered.listen((
        IosNotificationSettings settings) {
      Vibration.vibrate(duration: 1000, amplitude: 128);
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    titles = new List<String>(carList.length);
    address = new List<String>(carList.length);
    id = new List<String>(carList.length);
    images = new List<Widget>(carList.length);

    /// 데이터 셋팅
    for(int i=0; i<carList.length; i++){
      titles[i] = carList[i]['fields']['Name'];
      address[i] = carList[i]['fields']['Address'];
      id[i] = carList[i]['id'];
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
    }

    return Scaffold(
      body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: VerticalCardPager(
                          textStyle: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                          titles: titles,
                          images: images,
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
                                            child: Text(titles[selectIndex] + "\t상세화면",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                          ),
                                        ),

                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height/15,
                                          alignment: Alignment(0.0, 0.0),
                                          child: Text('도착지 : ' + address[selectIndex] ,style: TextStyle(fontSize: 17.0),),
                                        ),

                                        SizedBox(
                                          height: 10.0,
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
                                          height: MediaQuery.of(context).size.height/12,
                                          alignment: Alignment(0.0, 0.0),
                                          child: CupertinoButton(
                                            child: Text("도착 메세지 보내기", style: TextStyle(fontWeight: FontWeight.bold),),
                                            color: Colors.orangeAccent,
                                            onPressed: () {
                                              print(_babyData.length);
                                              for(var i=0; i < _babyData.length; i++){
                                                print(_babyData[i].toString());
                                                http.post( _url + '/target', body:{
                                                  "name" : _babyData[i].toString()
                                                });
                                              }
                                            },
                                          )
                                        ),

                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height/12,
                                          alignment: Alignment(0.0, 0.0),
                                          child: CupertinoButton(
                                            child: Text("삭제", style: TextStyle(fontWeight: FontWeight.bold),),
                                            color: Colors.purple[200],
                                            onPressed: () async{
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context){
                                                    return AlertDialog(
                                                      title: Text('해당 코스를 삭제시키겠습니까?' , style: TextStyle(fontWeight: FontWeight.bold),),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text('삭제'),
                                                          onPressed: () async{
                                                            await  http.post( _url + '/courseDelete', body: {
                                                              "id": id[selectIndex]
                                                            });
                                                            setState(() {});
                                                            Navigator.pop(context);
                                                          },
                                                        ),
                                                        FlatButton(
                                                          child: Text('취소'),
                                                          onPressed: (){
                                                            Navigator.pop(context, "취소");
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  }
                                              );
                                            },
                                          ),

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
              ),

      /***** 주소지 추가 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarCourseCreate())).then((value){
            setState((){});
          });
        },
        label: Text("코스추가",style: TextStyle(fontWeight: FontWeight.bold),),
        icon: Icon(Icons.map),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

