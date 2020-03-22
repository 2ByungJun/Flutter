import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier{
  bool _isJoin = false; // _안해주면 다른 곳에서 접근해서 변경하면 골치아파진다.

  // isJoin을 받아야한다.
  bool get isJoin => _isJoin;

  // isJoin이 true면 false로, 혹은 반대로 바꿔준다.
  void toggle(){
    _isJoin = !_isJoin;
    notifyListeners();
    // 실행하면, ChangeNotifier 을 사용하고 있는 위젯들에게 알림을 보내줌.
  }
}