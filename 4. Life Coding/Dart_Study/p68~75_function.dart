// p68 ~ 69
/// 1. 함수

/**
/// 매개변수가 한 개
int f(int x){
  return x + 10;
}

/// 매개변수가 두 개
int f2(int x, int z){
  return x + z + 10;
}

/// 매개변수 X
String s(){
  return '안녕하세요?';
}

/// return X
void s2(){
  print('Return이 없어도 괜찮아요.');
}

void main(){
  print(f(12)); // 22
  print(f2(10,10)); // 30
  print(s()); // 안녕하세요?
  s2(); // Return이 없어도 괜찮아요.
}
**/

// p 69 ~ 70
/// 2. void 생략, $ 기호
/**
void greeting(String greet){
  print('hello $greet');
}
**/

/// 위의 함수와 동일(void 생략)
/**
greeting(String greet){
  print('hello $greet');
}
**/

/// $ 기호 : 문자열 내에 변수 삽입 및 {} 수식 표현이 가능
/**
String _name = '홍길동';
int _age = 20;

void main(){
  print('$_name은 $_age살입니다.');
  print('$_name은 ${_name.length}글자입니다.');
  print('10년 후에는 ${_age + 10}살입니다.');
}
**/

// p70 ~72
/// 3. 함수와 클래스 안 메서드
/**
 *  클래스 밖에 작성하는 함수를 최상위 함수라고 합니다.
 *  클래스는 객체를 표현하는 방법이다.
 *  최상위 함수는 어디에서나 호출할 수 있는 함수이다.
 * 
 *  메서드란?
 *  클래스 내부에 작성하는 함수이다.
 *  정의된 클래스에 관계된 기능을 수행합니다.
**/

/// no static?
/**
class MyClass{
  // 메서드
  bool isEven(int number){
    return number % 2 == 0;
  }
}

void main(){
  var myClass = MyClass(); // MyClass를 사용할 수 있게 var타입 변수에 저장
  print(myClass.isEven(10)); // 자료구조의 구조체처럼 사용한다.
}
**/

/// Yes static!
/**
class MyClass2{
  // Static Method
  static bool isEven2(int number){
    return number % 2 == 0;
  }
}

main(){ // void 생략 가능
  print(MyClass2.isEven2(10));
}
**/

/// Ex
/**
void main(){
  Person person = Person('lbj', age : 20);
  person.greeting();
}

class Person{
  String name;
  int age;
  
  Person(this.name, {this.age}); // 생성자
  
  void greeting(){
    print('안녕하세요 저는 $name입니다.');
  }
}
**/

// p72 ~74
/// 3. 람다식, 선택 매개변수

/// 3-1. 람다식
/**
 * Dart에서는 람다 표현식(이하 람다식)이라는 함수 표현 방식을 지원합니다.
 * => 왼쪽에는 인수명을 작성하고, 오른쪽에는 동작할 코드 또는 반환값을 작성합니다.
 * ([인수명]) => [동작 또는 반환값]
**/

/// 짝수 구하는 함수를 람다식으로?
// (number) => number % 2 == 0;

/// 3-2. 선택 매개변수
/// {}로 매개변수를 넣어 선택형 매개변수를 만들 수 있습니다.
/**
void something({String name, int age}){}

void main(){
  something(name : '홍길동', age : 10);
  something(name : '홍길동');
  something(age : 20);
  something();
}
**/
/**
/// 선택 매개변수를 기본값을 지정할 수 있습니다.
void something2({String name, int age=10}){
}
void main(){
  something(name : '홍길동', age : 10); // 홍길동, 10살
  something(name : '홍길동'); // 홍길동, 10살
}
**/

// p74 ~ 75
/// 4. 분기와 반복

/// 4-1. if else
/**
void main() {
  String text = 'hello';

  if (text is int) {
    print('정수');
  } else if (text is double) {
    print('실수');
  } else {
    print('정수도 실수도 아님');
  }
}
**/

/// 4-2. 삼항 연산울 활용한 분기
/// [조건] ? [참일 때] : [거짓일 때]
/// var todo = isRainy ? '빨래를 하지 않는다' : '빨래를 한다';

/// 4-3. switch case
/**
 * 조건에 맞는 값이 여러 개일 때 유용한 문법입니다.
 * 특히 열거(enum) 타입과 함께 사용할 때에는 모든 케이스를 검사해야 하는 강제성이 생깁니다.
 * 사람의 실수를 방지하는 이런 기능이 있어서 특수한 경우엔 if문보다 유용합니다.
**/
/**
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

void main(){
  var status = Status.Authenticated;
  switch(status){
    case Status.Authenticated:
      print('인증됨');
      break;
    case Status.Authenticating:
      print('인증 처리 중');
      break;
    case Status.Unauthenticated:
      print('미인증');
      break;
    case Status.Uninitialized:
      print('초기화됨');
      break;
  }
}
**/

/// 4-4. for
void main(){
var items = ['짜장', '라면', '볶음밥'];

  for ( var i = 0; i < items.length; i++ ){
    print(items[i]);
  }
}