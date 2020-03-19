// p76 ~ p84
/// 1. class
/**
 * Dart는 실제 현실 세계를 반영한 객체 지향 프로그래밍 언어입니다.
 * class
 *    프로퍼티(property) : 클래스 안의 속성
 *    메서드(Method) : 클래스와 어울리는 함수
 * 
 * 메모리
 *    인스턴스(Instance) : 객체들이 메모리에 작성된 것(인스턴스화)
 *    * 인스턴스화 : 객체들이 메모리에 작성되기 위해서는 인스턴스화가 필요한데,
 *                  이를 진행하기 위해선 '설계도'가 필요하다.
 *                  '설계도'가 바로 calss(클래스)이다.
**/

/**
class Person{
  String name;
  int age;
  
  void addOneYear(){
    age++;
  }
}

void main(){
  var person = new Person();
  //var person2 = Person(); // new 키워드 생략 가능
  
  person.name = '이병준';
  person.age = 25;
  print(person.name);
  print(person.age);
  print('${person.age}살');
  
  person.addOneYear(); // 1년후 
  print('1년후 나이 : ${person.age}'); // 26
}
**/

// 2. class 접근지정자 "_변수"
// 변수 앞에 _(언더바)가 붙는 경우에는 외부 함수에서 접근이 불가능해진다.
/**
class Person {
  String name;
  int _age;
  
  void addOneYear(){
    _age++;
  }
}

void main(){
  var person = Person();
  //person._age = 10; 에러!! 접근 불가 
}
**/

// 3. 생성자
// 생성자는 인스턴스화하는 방법을 제공하는 일종의 메서드입니다.
/// Dart는 기본 생성자를 제공하는데, 기본 생성자는 클래스명과 같은 이름의 메서드입니다.
/**
class Person{
  String name;
  int _age;
}

var person = Person(); // 생성자
**/

/**
 *  사용자 정의 생성자를 추가하면 기본 생성자(Person())를 사용할 수 없게 되지만,
 *  선택 매개변수를 사용하면 Person()도 호출할 수 있습니다.
class Person{
  String name;
  int age;
  
  Person({this.name, this.age}); // 생성자
}

void main(){
  var person = Person(); // ok
  var person2 = Person(name : '홍길동',age : 20); // ok
}
**/

// 4. 게터, 세터
/**
 * 프라이빗(private) 변수에 접근하려면 게터(getter)와 세터(setter)메서드가 필요합니다.
 * 각각 읽기와 쓰는 기능을 합니다.
**/
/**
class Person{
  String name;
  int _age = 20;
  
  int get age => _age;
}

main(){
  var person = Person();
  print(person.age); // _age값이 출력됨
}
**/

// 5. 상속(extends)
// 상속을 주는 쪽이 슈퍼클래스(또는 부모 클래스), 받는 쪽을 서브클래스(또는 자식 클래스)이다.
/// EX
/**
class Hero{
  String name = '영웅';
  
  void run(){}
}

class SuperHero extends Hero { // Hero를 상속
  // 부모의 run()메서드를 다시 정의(오버라이드)
  void run(){
    super.run();
    this.fly(); // 추가로 fly()도 실행
  }
  
  void fly(){}
}

void main(){
  var hero = SuperHero();
  hero.run(); // ok
  hero.fly(); // ok
  print(hero.name); // 영웅
}
**/

// 6. 추상클래스(abstract class)
/**
abstract class Monster {
  void attack();
}
/// 추상 클래스는 그대로 인스턴스화할 수 없으며 다른 클래스에서 임플리먼트(implement)하여,
/// 기능을 완성하는 상속 재료로 사용됩니다.
class Goblin implements Monster{
  void attack(){
    print('고블린 어택');
  }
}

class Bat implements Monster {
  void attack(){
    print('할퀴기!');
  }
}

/// 여러 추상 클래스를 한 번에 임플리먼트할 수 있습니다.
/// 추상 클래스를 구현할 때는 모든 추상 메서드를 재정의 해야 합니다.
abstract class Flyable {
  void fly();
}

class Bat implements Monster, Flyable {
  void attack() {
    print('할퀴기!');
  void fly() {
    print('펄럭펄럭');
  }
  }
}
**/

// 6. 믹스인(Mixin)
/// with 키워드를 사용하면 상속하지 않고 다른 클래스의 기능을 가져오거나 오버라이드할 수 있습니다.
/**
class Goblin implements Monster {
  void attack(){
    print('고블린 어택');
  }
}

class DarkGoblin extends Goblin with Hero{
  // DarkGoblin은 Monster, Goblin, Hero 클래스들의 기능을 모두 가지고 있습니다.
}
**/

// 7. 열거타입
/// 열거 타입(enum type)은 상수를 정의하는 특수한 형태의 클래스입니다.
/// 예를들어 로그인, 로그아웃 두가지 상태만 있는 시스템에서는 사용할 상태를 열거 타입으로 정의하면 유용합니다.

enum Status { login, logout }

void main(){
  var authStatus = Status.logout;
  
  /// switch랑 함께 사용하면 열거 타입으로 정의된 모든 상수를 case로 검토하도록 강제하기 때문에 에러방지에 효과적입니다.
  switch(authStatus){
    case Status.login:
      print("로그인");
      break;
    case Status.logout:
      print("로그아웃");
      break;
  }
}