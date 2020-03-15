import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  // 다시 사용한 컨트롤러의 인스턴스는 반드시 화면이 종료될 때 dispose()로 해제해야 합니다.
  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }


  @override
  final _formkey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form( // 폼
          key: _formkey, // 키 할당
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration( // 외곽선이 있고 힌트를 '키'로 표시
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                controller: _heightController,
                keyboardType: TextInputType.number, // 숫자만 입력 가능
                validator: (value) {
                  if(value.trim().isEmpty){ // 입력한 값의 앞뒤 공백을 제거한 것이 비어있다면 에러 메세지 표시
                    return '키를 입력하세요';
                  }
                  return null; // null을 반환하면 에러가 없는 경우
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                controller: _weightController,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    // 폼에 입력된 값 검증
                    if (_formkey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiResult(
                            double.parse(_heightController.text.trim()),
                            double.parse(_weightController.text.trim())
                          )
                        )
                      );
                      // 검증시 처리
                    }
                  },
                  child: Text('결과'),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}

class BmiResult extends StatelessWidget {
  final double height; // 키
  final double weight; // 몸무게

  BmiResult(this.height, this.weight); // 키와 몸무게를 받는 생성자

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    print('bmi : $bmi');

    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( _calcBmi(bmi) // 계산 결과에 따른 결과 문자열
              , style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 16,
            ),
            _buildIcon(bmi), // 계산 결과에 따른 아이콘
          ],
        ),
      ),
    );
  }
  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }

  String _calcBmi(double bmi){
    var result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30){
      result = '2단계 비만';
    } else if ( bmi >= 25){
      result = '1단계 비만';
    } else if ( bmi >= 23){
      result = '과체중';
    } else if ( bmi >= 18.5){
      result = '정상';
    }
    return result;
  }

}
