import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    home: FCMTest(),
  ));
}

class FCMTest extends StatefulWidget {
  @override
  _FCMTestState createState() => _FCMTestState();
}

class _FCMTestState extends State<FCMTest> {
  final _url = "http://172.30.1.21:4000";
  String _homeScreenText = "토큰 메세지";
  String _messageText = "대기 메세지";
  String result;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<String> fetch() async {
    http.Response _res = await http.get(_url + "/");
    String _resBody = json.decode(_res.body);
    print(_resBody);
    return _resBody;
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      this.result = await this.fetch();
      setState(() {});
      print(result);
      return;
    });

    _firebaseMessaging.getToken()
        .then((String token) {

      setState(() {
        _homeScreenText = token;
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

      setState(() {
        print("토큰 /*/************//// ${_homeScreenText.toString()}");
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FCM TEST"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(_homeScreenText),

          Text(_messageText),

          Text(result),

          RaisedButton(
            child: Text("123"),
            onPressed:() async{
              //              await http.get(_url/sended);
              final http.Response _res = await http.post('$_url/target', body: {"id": "123", "targetId":"456", "des": "123이 456에게"});
              final List<bool> _resultCheck = json.decode(_res.body);
              if (!_resultCheck[0]) return;
            },
          ),

          RaisedButton(
            child: Text("456"),
            onPressed:() async{
//              await http.get(_url + '/sended/1234');
              await http.post('$_url/target', body: {"id": "456", "targetId":"123", "des": "123이 456에게"});
//              final List<bool> _resultCheck = json.decode(_res.body);
//              if (!_resultCheck[0]) return;
            },
          )


        ],
      )
    );
  }
}
