// p87 ~ 94
/// 1. 함수형 프로그래밍
/**
 * Dart는 객체 지향 프로그래밍과 함수형 프로그래밍 특징들을 모두 제공합니다.
 * 함수형 프로그래밍 : 자료 처리를 수학적 함수의 계산으로 취급하는 프로그래밍 패러다임입니다.
 * 특히, Dart의 collection은 함수형 프로그래밍을 지원하는 다양한 함수를 제공합니다.
**/


/// 1-1. 일급 객체(first-class object)
/// Dart에서는 함수를 값으로 취급할 수 있습니다.
/// 그러므로 다른 변수에 함수를 대입할 수 있습니다.
/**
void greeting(String text){
  print(text);
}

// 다른 함수의 인수로 함수 자체를 전달하거나 함수를 반환받을 수도 있습니다.
void something(Function(int i) f){
  f(10);
}

void main(){
  var f = greeting; // 함수를 다른 변수에 대입할 수 있음
  f('hello');
  
  something((value){
    print(value);
  });
}
/// 이와같이 함수를 매개변수로 전달하기, 수정하기, 변수에 대입하기가 가능한 객체를 일급 객체(first-class object)라고 합니다.
**/
/// EX
/**
void something(Function(int i) f){
  f(10);
}

void myPrintFunction(int i){
  print('내가 만든 함수에서 출력한 $i');
}

void main(){
  something(myPrintFunction); // 내가 만든 함수에서 출력한 10
  something((i) => myPrintFunction(i)); // 내가 만든 함수에서 출력한 10
  something((i) => print(i)); // 10
  something(print); // 10
}
**/


/// 1-2. for문과 forEach() 함수
/// for문은 대표적인 반복문입니다. for문은 외부 반복을 합니다.
/**
final items = [1, 2, 3, 4, 5];

void main(){
  for( var i = 0; i < items.length; i++ ){
  print(items[i]); // 1, 2, 3, 4, 5
  }
}
**/
/// 반면에 forEach()함수는 내부 반복을 수행합니다.
/// 겉보기에는 반복문 형태가 아니지만 내부적으로는 반복을 하고 있습니다.

/**
 * forEach()함수는 (E element) {} 형태의 함수를 인수로 받습니다.(E는 모든 타입이 가능하다는 것을 의미합니다.)
 * print()함수도 int 타입의 인수를 하나 받을 수 있습니다.
 * 따라서 위의 for문 예제와 같은 코드를 print()와 forEach()함수를 사용해 다음과 같이 구현할 수 있습니다.
**/
/**
items.forEach(print); /// 1,2,3,4,5

// 익명 함수로
items.forEach((e){
  print(e);
});

// 람다식으로
items.forEach((e) => print(e));
**/
/// 해석 : e는 items의 각 요소가 내부적으로 반복하면서 하나씩 들어올 인수입니다. 이것을 print()에 전달한다는 의미입니다.
/// 다음 코드도 같은 결과를 냅니다.
// items.forEach(print);


// 1.3 where
// 조건을 필터링할 때 사용하는 함수입니다.
// 예른 들어 짝수만 출력하고 싶을 때, for문과 if문을 사용하는 코드는 다음과 같습니다.
/**
final items = [1, 2, 3, 4, 5];

main(){
  for( var i = 0; i<items.length; i++){
    if( items[i]%2 == 0){
      print(items[i]); // 2, 4
    }
  }
}

// where()함수 활용
main(){
  items.where((e) => e%2 == 0).forEach(print); // 2, 4
}
**/


// 1.4 map
/// map() 함수는 반복되는 값을 다른 형태로 변환하는 방법을 제공하는 함수입니다.
/// 다음은 짝수를 찾아 '숫자'라는 글자를 붙여 문자열 형태로 출력하는 예제입니다.
/**
main(){
  final items = [1,2,3,4,5];
  
  for(var i=0; i<items.length; i++){
    if(items[i] % 2 == 0){
      print('숫자 ${items[i]}'); // 숫자 2, 숫자 4
    }
  }
  // map()을 사용하면?
  items.where((e) => e%2 ==0).map((e) => '숫자 $e').forEach(print);
}
**/

// 1.5 toList
// 결과를 리스트를 저장하는 예제 코드,
/**
final items = [1, 2, 3, 4, 5];

main(){
  final result = [];
  items.forEach((e){
    if(e%2 == 0){
      result.add(e);
    }
  });
  
  // tolist로?
  // final result = items.where((e) => e%2==0).toList();
}
**/
// toList()는 where(), map()과 같이 Iterable 인터페이스를 반환하는 메서드에서 사용할 수 있습니다.


// 1.6 toSet
/// 리스트에 중복된 데이터가 있을 경우 중복을 제거한 리스트를 얻고 싶을 때 사용
/// for문을 사용하 짝수 리스트를 얻는 코드를 다음과 같이 구현할 수 있습니다.

// final items = [1, 2, 2, 3, 3, 4, 5];
// final result = items.where((e) => e%2 == 0).toLsit(); // 2, 2, 4
// final result = items.where((e) => e%2 == 0).toSet().toList(); // 2, 2, 4


// 1.7 any
/// any() 함수는 리스트에 특정 조건을 충족하는 요소가 있는지 없는지 검사할 때 사용
// print(items.any((e) => e % 2 == 0)); // true


// 1.8 reduce
/// reduce() 함수는 반복 요소를 줄여가면서 결과를 만들 때 사용하는 함수입니다.
/// dart:math 패키지는 max(),min() 등 다양한 수학 함수를 제공합니다.

import 'dart:math';
final items = [1, 2, 3, 4, 5];

main(){
  print(items.reduce((e, v) => max(e, v))); // 5
  
  final result = items.reduce(max); // 5
}