import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids_course/helper/loginbackground.dart';
import 'package:kids_course/screens/forget_pw.dart';
import 'package:kids_course/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:kids_course/data/join_or_login.dart';

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
              painter:
              LoginBackground(isJoin: Provider
                  .of<JoinOrLogin>(context)
                  .isJoin),
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
                  height: size.height * 0.03,
                ),
                Consumer<JoinOrLogin>(
                  builder: (context, joinOrLogin, child) =>
                      GestureDetector(
                          onTap: () {
                            joinOrLogin.toggle();
                          },
                          child: Text(
                            joinOrLogin.isJoin
                                ? "회원가입을 누르시면 계정이 만들어집니다."
                                : "계정이 없으시다구요? 클릭하세요!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: joinOrLogin.isJoin ? Colors.red : Colors
                                    .indigo),
                          )),
                ),
                Container(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ],
        ));
  }

  // 계정 생성
  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snackBar = SnackBar(
        content: Text('잠시 후에 다시 시도해주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    // 다른 방법 Navigator 로 전환
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  // 로그인(_회원가입에서 복붙 후 수정)
  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snackBar = SnackBar(
        content: Text('잠시 후에 다시 시도해주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
    // 다른 방법 Navigator 로 전환
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
              child: Text(
                joinOrLogin.isJoin ? "회원가입" : "로그인",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              color: joinOrLogin.isJoin ? Colors.red : Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  joinOrLogin.isJoin ? _register(context) : _login(context);
                }
              },
            ),
          ),
        ),
      );

  Widget get _logoImage => Expanded(
        // Column 이나 Row 에 쓰이는 것으로, 위에 남는 공간을 다 차지하게 한다.
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 50, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo.gif"),
            ),
          ),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 30),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 24),
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
                  Consumer<JoinOrLogin>(
                    builder: (context, joinOrLogin, child) => Opacity(
                        opacity: joinOrLogin.isJoin ? 0 : 1,
                        child: GestureDetector(
                            onTap: joinOrLogin.isJoin ? null :(){goToForgetPw(context);},
                            child: Text("           패스워드를 잊어버리셨나요?"))),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  goToForgetPw(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgetPw()));
  }
}
