// p61
/// 1. Hello World!
/**
void main() {
  print("Hello, World!");
}
**/

// p62 ~ p64
/// 2. 변수 선언
/**
String name;    // 변수 선언
name = '홍길동'; // 값 할당("홍길동"도 가능);

bool b = true; // 참(거짓은 false)
bool b2 = i < 10; // i는 10보다 작다.
bool b3 = s.isEmpty;

int i = 10; // 정수 10
double d = 10.0; // 실수 10.0

/// num은 int와 double를 포함한다.
num a = 10;
num b = 20.0;

/// var로 대체할 수 있는 타입 추론
var i = 10;
var d = 10.0;
var s = "hello";
var s2 = 'hello';
var b = true;
var b2 = i < 10;
var b3 = s.isEmpty;
**/

// p64 ~ p65
/// 3. 상수 final, const : 값이 수정되지 않는 상수
/**
final String name = '홍길동'; // String 생략 가능
/// name = '임꺽정'; (에러)

/// assert() 함수는 계산 결과가 참인지 검사
assert(2 + 5 == 5); // true
assert('hello' + ' world' == 'hello world');
**/

// p65 ~ p67
/// 4. 증감 연산자 & 비교 연산자 & 논리 연산자

/// 4-1. 증감 연산자
/**
var num = 0;
print(num++); // 나중에 계산하므로 0 출력
// num = 1이됨
print(++num); // 먼저 계산하므로 2 출력
// num = 2가 됨
**/

/// 4-2. 비교 연산자
// == : 같다
// != : 다르다
// >  : 더 크다
// <  : 더 작다
// >= : 크거나 작다
// <= : 작거나 크다

// 4-3. 놀리 연산자
// && : 그리고
// || : 또는
// == : 같다
// !  : 부정
// != : 다르다

// p67
/// 5. 타입 검사

// is : 같은 타입이면 true
/**
int a = 10;
if(a is int){
  print('정수');
}

// is! : 다른 타입이면 true
String text = 'hello';
if(text is! int) {
  print('숫자가 아님');
}
**/