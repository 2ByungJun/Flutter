// p83 ~ p87
/// 1. 컬랙션(collection)
/**
 * List : 같은 타입의 자료를 여러 개 담을 수 있고 특정 인덱스로 접근할 수 있습니다.
 * Map : 키(key)와 값(value)의 쌍으로 저장할 수 있고, 키를 통해 값을 얻을 수 있습니다.
 * Set : 중복이 허용되지 않고, 찾는 값이 있는지 없는지 판단하고자 할 때 사용합니다.
**/

/// 1-1. List
/// 순서가 있는 자료를 담는 컬렉션입니다. Dart는 배열을 제공하지 않습니다.
// List<String> items = ['짜장', '라면', '볶음밥'];

/// <String>는 리스트에 담길 데이터 타입을 지정합니다.
/// 일반적으로는 var로 선언합니다.
// var items = ['짜장', '라면', '볶음밥'];
/**
void main(){
 items[0] = '떢볶이'; // 인덱스는 0부터 시작

  print(items.length); // 3
  print(items[2]); // 볶음밥
  print('\n');
  // print(items[3]); // 에러 
  
  for( var i=0; i < items.length; i++){
    print(items[i]); // 떢볶이, 라면, 볶음밥
  }
}
**/
/// dynamic : 모든 타입을 대변하는 특수한 타입, var을 주로 쓴다.
// List<dynamic>list = [];
// var list = [];

/// 1-2. 스프레드 연산자(...)
/// ...연산자는 컬렉션을 펼쳐주는 연산자로 스프레드(spread)연산자라고 합니다.
/// 다른 컬렉션 안에 컬렉션을 삽일할 때 사용합니다.

// List<String> items = ['짜장','라면','볶음밥'];과 같음
/**
var items = ['짜장', '라면', '볶음밥'];
var items2 = ['떡볶이', ...items, '순대']; // 떡볶이, 짜장, 라면, 볶음밥, 순대

// 다음과 같이 리스트를 Set에 담게 되면 자동으로 중복 제거의 효과를 얻는다
final = items = [1, 2, 2, 3, 3, 4, 5];
final = myNum = {...items, 6, 7};
print(myNum); // 1, 2, 3, 4, 5, 6, 7 
**/

// 1-3. Map
/// 순서가 없고 탐색이 빠른 자료구조 컬렉션입니다.
/// 키(Key)와 값(value)의 쌍으로 이루어져 있어 키를 이용하여 값을 빠르게 얻을 수 있다.
/// 해당하는 값이 없다면 없음을 의미하는 null을 반환합니다.

// Map<String, String> cityMap = { ...생략... };과 같음
/**
var cityMap = {
  '한국': '부산',
  '일본': '도쿄',
  '중국': '북경',
};

void main(){
  cityMap['한국'] = '서울';

  print(cityMap.length);  // 3
  print(cityMap['중국']); // 북경
  print(cityMap['미국']); // null
  
  cityMap['미국'] = '워싱턴'; // 새로운 값 추가
  print(cityMap['미국']); // 워싱턴
}
**/

// 1-4. Set
/// 집합을 표현하는 자료구조 컬렉션입니다.
/// add(), remove() 메서드로 집합에 추가하거나 삭제가 가능하다.
/// contains() 메서드는 찾고자 하는 자료가 집합에 있는지 없는지 boolean타입으로 반환하기 때문에 집합에 요소가 있는지 검사할 때, 사용합니다.
/// 리스트와 다르게 중복을 허용하지 않습니다.

// Set<String> citySet = {...생략...};과 같음
var citySet = {'서울','수원','오산','부산'};

void main(){
  citySet.add('안양');    // 추가
  citySet.remove('수원'); // 삭제
  
  print(citySet.contains('서울')); // true
  print(citySet.contains('도쿄')); // false
}