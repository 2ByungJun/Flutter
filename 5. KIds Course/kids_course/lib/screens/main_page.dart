import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kids_course/memodata/db.dart';
import 'package:kids_course/memodata/memo.dart';
import 'package:kids_course/memoview/memoMain.dart';
import 'package:kids_course/memoview/memoView.dart';
import 'package:kids_course/screens_upper/car_course.dart';
import 'package:kids_course/screens_Page1_2_3/ful_page2.dart';
import 'package:kids_course/screens_Page1_2_3/ful_page3.dart';

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
            _buildBottom(context),
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
Widget _buildBottom(BuildContext parentContext) {
  return FutureBuilder<List<Memo>>(
      builder: (context, snap)
  {
    if (snap.data == null || snap.data.isEmpty) {
      return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          '현재 공지사항이 없습니다.\n상단의 "공지사항"을 클릭해 새로운 공지사항을 등록하세요.\n\n\n\n\n\n\n\n\n\n',
          style: TextStyle(fontSize: 15, color: Colors.orange,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      itemCount: snap.data.length,
      itemBuilder: (context, index) {
        Memo memo = snap.data[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                parentContext,
                CupertinoPageRoute(
                    builder: (context) => ViewPage(id: memo.id)));
          },
          child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        memo.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        memo.text,
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "최종 수정 시간: " + memo.editTime.split('.')[0],
                        style: TextStyle(fontSize: 11),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.orange,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.orange, blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(12),
              )),
        );
      },
    );},
    future: loadMemo(),
  );
}

Future<List<Memo>> loadMemo() async {
  DBHelper sd = DBHelper();
  return await sd.memos();
}

// Page 2
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 리본 제거
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: fulpage2(),
    );
  }
}

// Page 3
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 리본 제거
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: fulpage3(),
    );
  }
}

