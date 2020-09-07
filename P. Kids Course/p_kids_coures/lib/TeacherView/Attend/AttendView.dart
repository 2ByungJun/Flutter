import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../PageManager.dart';
import 'AttendCreate.dart';

  final _url = PageManagerView.url;
  // ignore: non_constant_identifier_names
  Color CornflowerBlue = Color(0xFF7087F0);

  Future<List> fetchBaby() async {
    http.Response _res = await http.get(_url + "/baby");
    List<dynamic> _resBody = json.decode(_res.body);
    return _resBody;
  }

  class AttendView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: FutureBuilder<List>(
          future: fetchBaby(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? BabyList(babys: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AttendCreate()));
            setState(){}
          },
          label: Text( "원아 등록", style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: Icon(Icons.add_box),
          backgroundColor: CornflowerBlue,
        ),
      );
    }
  }

  class BabyList extends StatefulWidget {
    final List<dynamic> babys;
    const BabyList({Key key, this.babys}) : super(key: key);
    @override
    _BabyListState createState() => _BabyListState();
  }

  class _BabyListState extends State<BabyList> {
    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: ListView.builder(
                    itemCount: widget.babys.length,
                    itemBuilder: (context, index) {
                      return Text(widget.babys[index]['fields']['BabyName'].toString());
                    },
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
              )
            ],
          ),
        ),
      );
    }
  }

/*GridView.builder(
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
),
itemCount: widget.babys.length,
itemBuilder: (context, index) {
return Text(widget.babys[index]['fields']['BabyName'].toString());
},
),*/

/*

SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
*/
/***** 해당 반 선택 *****//*

Container(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Container(
margin: EdgeInsets.only(
top: 5.0, bottom: 5.0, right: 20.0),
width: 70.0,
height: 70.0,
child: ClipOval(
child: Image.asset(
"images/" + _labelImg[_selectedImg],
fit: BoxFit.cover),
)),
Container(
child: DropdownButton(
icon: Icon(Icons.arrow_drop_down_circle),
iconSize: 24,
iconEnabledColor: Colors.deepOrange,
elevation: 16,
focusColor: Colors.green,
style: TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
fontSize: 17,
),
underline: Container(
height: 3,
color: Colors.orange[300],
),
hint: Text(
'반 선택하기',
style:
TextStyle(fontWeight: FontWeight.bold),
),
value: _selectedLabel,
onChanged: (newValue) {
setState(() {
_selectedLabel = newValue;
_selectedImg = _selectedLabel;
});
},
items: _label.map((label) {
return DropdownMenuItem(
child: new Text(label),
value: label,
);
}).toList(),
),
),
],
),
),

*/
/***** 아이 리스트 *****//*

Container(
width: MediaQuery.of(context).size.width,
height: 400.0,
padding: const EdgeInsets.all(3.0),
decoration: new BoxDecoration(
borderRadius: BorderRadius.circular(30),
color: Colors.white,
border: Border.all(
width: 5, color: Colors.orange[200])),
child: ListView.builder(
scrollDirection: Axis.vertical,
itemCount: snap.data.length,
itemBuilder: (BuildContext context, int index) {
return Padding(
padding: const EdgeInsets.all(4.0),
child: Card(
child: ListTile(
onTap: () {},
onLongPress: () async {
bool _check = await showDialog(
context: context,
builder: (_) => AlertDialog(
title: Text("삭제하시겠어요?"),
content: Text(
"삭제하시려면 확인을 눌러주세요."),
actions: <Widget>[
FlatButton(
child: Text("확인"),
onPressed:
() async {
// 로그인 헤더체크
// dart << content
// android,IOS <<  content 체크
final http
    .Response
_res =
await http.post(
'$_url/babyDelete',
body: {
"data": snap
    .data[
index]
[
'id']
    .toString()
});
final bool
_resultCheck =
json.decode(
_res.body);
if (!_resultCheck)
return;
Navigator.of(
context)
    .pop(
_resultCheck);
},
),
FlatButton(
child: Text("취소"),
onPressed: () {
Navigator.of(
context)
    .pop(false);
},
)
],
)) ??
false;
print(_check);
// await 삭제중입니다. (model)
if (!_check) return;
setState(() {});
},
leading: Container(
width: 50.0,
height: 50.0,
child: ClipOval(
child: Image.asset(
"images/" +
_labelImg[snap.data[index]
['fields']['Label']],
fit: BoxFit.cover),
),
),
title: Text(snap.data[index]['fields']
['BabyName']),
subtitle: Text(snap.data[index]
['fields']['ParentsName'] +
" : " +
snap.data[index]['fields']
['Phone']),
trailing: Checkbox(
value: false,
onChanged: (bool change) {
setState(() {
snap.data[index]['fields']
['Attend'] = change;
});
},
)),
),
);
},
))
])),
);
}),

*/
/***** 원아 등록 *****//*

floatingActionButton: FloatingActionButton.extended(
onPressed: () async {
await Navigator.of(context)
.push(MaterialPageRoute(builder: (context) => AttendCreate()));
setState(() {});
},
label: Text(
"원아 등록",
style: TextStyle(fontWeight: FontWeight.bold),
),
icon: Icon(Icons.add_box),
backgroundColor: Colors.deepOrange,
),
);*/
