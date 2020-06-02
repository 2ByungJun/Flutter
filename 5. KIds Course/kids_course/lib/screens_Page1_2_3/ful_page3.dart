import 'package:flutter/material.dart';

class fulpage3 extends StatefulWidget {
  @override
  _fulpage3State createState() => _fulpage3State();
}

class _fulpage3State extends State<fulpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  '교사명',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  '연락처',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  '연락',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(
                    Text('교사1'),
                  ),
                  DataCell(
                    Text('010-3333-3333'),
                  ),
                  DataCell(
                      Icon(Icons.call),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text('교사2'),
                  ),
                  DataCell(
                    Text('010-4113-5555'),
                  ),
                  DataCell(
                    Icon(Icons.call),
                  ),
                ]),
              ],
            ),
            DataTable(
              columns: [
                DataColumn(
                    label: Text(
                      '아이명',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      '연락처',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      '연락',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(
                    Text('아이1'),
                  ),
                  DataCell(
                    Text('010-3333-3333'),
                  ),
                  DataCell(
                    Icon(Icons.call),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(
                    Text('아이2'),
                  ),
                  DataCell(
                    Text('010-4113-5555'),
                  ),
                  DataCell(
                    Icon(Icons.call),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {},
        tooltip: '원아 계정을 추가',
        label: Text('원아계정 등록',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
