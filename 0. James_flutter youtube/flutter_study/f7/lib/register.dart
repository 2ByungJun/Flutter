import 'package:f7/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("키즈코스 회원가입"),
        backgroundColor: Colors.deepOrange,
      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                "보육교사님 환영합니다!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

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
                        size: 30.0
                    )
                ),
              ),
            ),

            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.all(5.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "비밀번호",
                    icon: Icon(Icons.vpn_key,
                        color: Colors.orange[400],
                        size: 30.0
                    )
                ),
              ),
            ),

            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "이름",
                    icon: Icon(Icons.person,
                        color: Colors.orange[400],
                        size: 30.0
                    )
                ),
              ),
            ),

            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "전화번호",
                    icon: Icon(Icons.call,
                        color: Colors.orange[400],
                        size: 30.0
                    )
                ),
              ),
            ),

            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.list,
                  color: Colors.orange[400],
                  size: 40.0,
                  ),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('Item 1'),
                          value: 'one',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Item 2'),
                          value: 'two',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Item 3'),
                          value: 'three',
                        ),
                      ],
                      onChanged: (String value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      hint: Text('반 선택하기'),
                      value: _value,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Text(
                "모든 사항들을 기입해주세요!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(5.0),
              child: RaisedButton(
                child: Text(
                  "회원가입",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => loginPage()
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
