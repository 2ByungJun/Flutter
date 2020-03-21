import 'package:flutter/material.dart';
import 'package:kids_course/helper/loginbackground.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CustomPaint(
              size: size,
              painter: LoginBackground(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _logoImage,
                Stack(
                  children: <Widget>[
                    _inputForm(size), // Input Form 위젯
                    _authButton(size), // authButton 위젯
                  ],
                ),
                Container(
                  height: size.height * 0.10,
                ),
                Text("계정이 없다구요?, 여기서 만들어보세요!"),
                Container(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
            child: Text(
              "로그인",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: Colors.indigo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if (_formKey.currentState.validate()) {}
            },
          ),
        ),
      );

  Widget get _logoImage => Expanded(
        // Column 이나 Row 에 쓰이는 것으로, 위에 남는 공간을 다 차지하게 한다.
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey, // 상태를 접근하게 해주는 역할
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "이메일을 작성해주세요!";
                      }
                      return null; // 작성하면, pass 한다.
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "패스워드를 작성해주세요!";
                      }
                      return null; // 작성하면, pass 한다.
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("패스워드를 잊어버리셨나요?"),
                ],
              )),
        ),
      ),
    );
  }
}
