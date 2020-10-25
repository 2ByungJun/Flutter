import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;

import 'loginView.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _url = "http://192.168.17.109:3000";
  String _homeScreenText = "토큰 메세지";
  String _messageText = "대기 메세지";
  String result = "결과";
  var tokenId = "";


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {


    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.getToken().then((String token){
      print('token:'+token);
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

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      Vibration.vibrate(duration: 1000, amplitude: 128);
      print("Settings registered: $settings");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('키즈코스', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.vpn_key,
              color : Colors.deepOrange
            ),
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginView()), (route) => false);
            },
          )
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Card(
              child: Container(
                width: 180,
                height: 180,
                color: Colors.blue,
              ),
            ),

            /// 데리러감
            GestureDetector(
              onTap: () async{
                print("푸시");
                final response = await http.post( _url + '/message1', body: {
                  "name" : "이병준"
                });
                print(response.statusCode);
                print(response.body);
              },
              child: Container(
                width:180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(width: 10.0, color: Colors.deepOrange[200])
                ),
                child: ClipOval(
                  child: Image.asset("images/logo.gif",fit: BoxFit.cover),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /// 등원못함
                GestureDetector(
                  onTap: () async{
                    await http.post( _url + '/message2', body: {
                      "name" : "이병준"
                    });
                  },
                  child: Container(
                    width:180,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(width: 10.0, color: Colors.blue[200])
                    ),
                    child: ClipOval(
                      child: Image.asset("images/logo.gif",fit: BoxFit.cover),
                    ),
                  ),
                ),

                /// 연락요청
                GestureDetector(
                  onTap: () async {
                    await http.post( _url + '/message3', body: {
                      "name" : "이병준"
                    });
                  },
                  child: Container(
                    width:180,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(width: 10.0, color: Colors.green[200])
                    ),
                    child: ClipOval(
                      child: Image.asset("images/logo.gif",fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}