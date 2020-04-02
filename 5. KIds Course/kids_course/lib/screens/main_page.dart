import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kids_course/memoview/memoMain.dart';
import 'package:kids_course/screens/car_course.dart';
import 'package:kids_course/screens/ful_page2.dart';
import 'package:kids_course/screens/ful_page3.dart';

final dummyItems = [
  'https://picsum.photos/200',
  'https://picsum.photos/201',
  'https://picsum.photos/202'
];

class MainlessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({this.email});
  final String email;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _index = 0; // 페이지 인덱스 0, 1, 2
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("키즈 코스의 방문을 환영합니다!",
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.vpn_key,
              color: Colors.white,
              size: 32.0,),
            tooltip: '로그아웃',
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
          )
        ],
        backgroundColor: Colors.orange,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index; // 선택된 탭의 인덱스로 _index를 변경
          });
        },
        currentIndex: _index, // 선택된 인덱스
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('홈',
              style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            icon: Icon(Icons.home,
              color: Colors.orange,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('차량지도',
              style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            icon: Icon(Icons.directions_bus,
              color: Colors.orange,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('관리',
              style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            icon: Icon(Icons.settings,
              color: Colors.orange,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Column 을 ListView 로 변경하면 상하 스크롤이 생긴다
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildTop(context),
            _buildMiddle(),
            _buildBottom(),
          ],
        ),
      ],
    );
  }
}
// 상단
Widget _buildTop(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20), // 위, 아래 여백
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // 위젯 사이의 공간을 동일한 비율로 정렬
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => car_courseless()),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_bus,
                    size: 40,
                    color: Colors.orange,
                  ),
                  Text('차량지도',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 40,
                    color: Colors.orange,
                  ),
                  Text('일정',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => memomain()),
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.mode_edit,
                    size: 40,
                    color: Colors.orange,
                  ),
                  Text('공지사항',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.call,
                    size: 40,
                    color: Colors.orange,
                  ),
                  Text('연락망',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10, // height 프로퍼티에 20을 주어 높이 20만큼 공간을 준다. (Row 의 간격 사이에)
        ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            // 위젯 사이의 공간을 동일한 비율로 정렬
//            children: <Widget>[
//              Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.local_taxi,
//                    size: 40,
//                  ),
//                  Text('택시'),
//                ],
//              ),
//              Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.local_taxi,
//                    size: 40,
//                  ),
//                  Text('블랙'),
//                ],
//              ),
//              Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.local_taxi,
//                    size: 40,
//                  ),
//                  Text('바이크'),
//                ],
//              ),
//              Opacity(
//                // 투명도 조절 Alt + Enter 로 아무거나 생성 후 Opacity 재구성
//                opacity: 0.0, // 투명도 max 0 ~ 1, 0.5 : 반투명
//                child: Column(
//                  children: <Widget>[
//                    Icon(
//                      Icons.local_taxi,
//                      size: 40,
//                    ),
//                    Text('대리'),
//                  ],
//                ),
//              ),
//            ],
//          ),
      ],
    ),
  );
}
// 중단
Widget _buildMiddle() {
  return CarouselSlider(
    height: 150.0, // 높이 150
    autoPlay: true, // 슬라이드가 자동으로 넘어감
    items: dummyItems.map((url) {
      // 이미지 파일 url 연결
      return Builder(
        builder: (BuildContext context) {
          // context 를 사용하고자 할 때
          return Container(
            width: MediaQuery.of(context).size.width, // 기기의 가로 길이
            margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우 여백 5
            decoration: BoxDecoration(color: Colors.amber // 배경색
            ),
            child: ClipRRect(
              // child 를 둥근 사각형으로 자르는 위젯
              borderRadius: BorderRadius.circular(8.0), // 모서리 둥금 정도
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}
// 하단
Widget _buildBottom() {
  final items = List.generate(10, (i) {
    return ListTile(
      leading: Icon(Icons.notifications_none),
      title: Text('[이벤트] 이것은 공지사항입니다'),
    );
  });
  return ListView(
    physics: NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작 금지
    shrinkWrap: true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정해야 함
    children: items,
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: fulpage2(),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: fulpage3(),
    );
  }
}

