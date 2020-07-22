import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttendView extends StatefulWidget {
  @override
  _AttendViewState createState() => _AttendViewState();
}

class _AttendViewState extends State<AttendView> {
  String _value; // 반 선택 값

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /***** 해당 반 선택 *****/
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: RaisedButton(
                          onPressed: (){},
                          child: Text("전체보기",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          color: Colors.purple[300],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(width: 3, color: Colors.deepOrange[300])),
                        child: Text(
                          "반 선택",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold,
                          color: Colors.black),
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          items: [
                            DropdownMenuItem<String>(
                              child: Text('달님반',style: TextStyle(fontWeight: FontWeight.bold),),
                              value: 'one',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('햇님반',style: TextStyle(fontWeight: FontWeight.bold)),
                              value: 'two',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('별님반',style: TextStyle(fontWeight: FontWeight.bold)),
                              value: 'three',
                            ),
                          ],
                          onChanged: (String value) {
                            setState(() {
                              _value = value;
                            });
                          },
                          hint: Text('반 선택하기'),
                          value: _value,
                        ),
                      ),
                    ],
                  ),
                ),

                /***** 데이터 테이블 *****/
                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(width: 5, color: Colors.orange[200])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              child: DataTable(
                                sortAscending: true,
                                sortColumnIndex: 1,
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    "이름",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "출결상태",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "상태",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ))
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text('아이1')),
                                    DataCell(Checkbox(
                                      value: true,
                                      onChanged: (bool value) {},
                                    )),
                                    DataCell(Text('등원완료')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('아이2')),
                                    DataCell(Checkbox(
                                      value: true,
                                      onChanged: (bool value) {},
                                    )),
                                    DataCell(Text('등원완료')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('아이3')),
                                    DataCell(Checkbox(
                                      value: true,
                                      onChanged: (bool value) {},
                                    )),
                                    DataCell(Text('등원완료')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('아이4')),
                                    DataCell(Checkbox(
                                      value: true,
                                      onChanged: (bool value) {},
                                    )),
                                    DataCell(Text('등원완료')),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /***** 출석 아이들 컨테이너 *****/
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        margin: EdgeInsets.only(top: 10.0),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(width: 3, color: Colors.deepOrange[300])),
                        child: Text(
                          "출석 현황",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              border: Border.all(width: 5, color: Colors.orange[200])),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      /***** 원아 등록 *****/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text("원아 등록"),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.green[500],
      ),
    );
  }
}
