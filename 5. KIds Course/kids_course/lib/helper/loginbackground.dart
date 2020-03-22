import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{

  // provider 을 위한 생성자를 만들어야한다.
  LoginBackground({@required this.isJoin}); // class 생성자 (고객이 주문한 주문서)
  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.indigo;
    // .. 때문에 = , = 이 가능하다.
    // Paint 오브젝트를 생성을 하여, 그 안에 있는 color 값을
    // Colors.blue 로 지정하여 paint에 넣어라!
    canvas.drawCircle(Offset(size.width*0.5, size.height*0.2), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}