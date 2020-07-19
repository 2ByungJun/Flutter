import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkidscoures/LoginView/loginRegister.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    print("자식 State########################");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /***** 상단부 *****/
              Container(
                child: Text(
                  "키즈코스",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "어린이집 차량지도를 보다 빠르게!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /***** 로고 *****/
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 10.0, color: Colors.orange[300])),
                  child: ClipOval(
                    child: Image.asset("images/logo.gif", fit: BoxFit.cover),
                  )),

              /***** InputBox *****/
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 50,
                      margin: EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "ID",
                            icon: Icon(Icons.account_circle,
                                color: Colors.orange[400],
                                size: 40.0
                            )
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '패스워드',
                            icon: Icon(Icons.vpn_key,
                                color: Colors.orange[400],
                                size: 40.0
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /***** 버튼(로그인&회원가입) *****/
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      child: Text(
                        "로그인",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.orange[400],
                      onPressed: (){
                        setState((){});
                      },
//                      onPressed: () {
//                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//                            builder: (BuildContext context) =>
//                                MyApp()), (route) => false);
//                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepOrangeAccent[400],
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => LoginRegisterView()
                          )
                      );
                    },
                  ),
                ],
              ),

              /***** 하단부 *****/
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "보육교사 전용 App",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}