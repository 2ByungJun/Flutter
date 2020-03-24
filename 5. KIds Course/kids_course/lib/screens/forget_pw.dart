import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("비밀번호 변경"),
      ),
        body: Form(
          key: _formKey,
          child: Column(
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
              FlatButton(onPressed: ()async{
                await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: _emailController.text);
                final snacBar = SnackBar(
                    content: Text('비밀번호 변경을 위한 이메일을 보냈으니 확인해주세요.'),
                );
                Scaffold.of(_formKey.currentContext).showSnackBar(snacBar);
              }, child: Text('변경 이메일을 보냅니다. 클릭하세요!',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
            ],
          ),
        )
    );
  }
}
