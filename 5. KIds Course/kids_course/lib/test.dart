import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vibration/vibration.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  FirebaseMessaging _firebaseMessaging;

  String _messageText = "들어올 데이터";
  String _homeScreenText = "토큰 데이터";

  @override
  void initState() {
    super.initState();
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken()
        .then((String token) {

      setState(() {
        _homeScreenText = token;
      });

      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          Vibration.vibrate(duration: 1000, amplitude: 128);
          setState(() {
            _messageText = "Push Messaging message: $message";
          });
          print("onMessage: $message");
        },
        onLaunch: (Map<String, dynamic> message) async {
          Vibration.vibrate(duration: 1000, amplitude: 128);
          setState(() {
            _messageText = "Push Messaging message: $message";
          });
          print("onLaunch: $message");
        },
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
        children: <Widget>[
          // 넘어오는 메세지
          Text(this._messageText),
          SizedBox(
            height: 20.0,
          ),
          // 기기에대한 토큰값
          Text(this._homeScreenText)
        ],
      ),
    );
  }
}
