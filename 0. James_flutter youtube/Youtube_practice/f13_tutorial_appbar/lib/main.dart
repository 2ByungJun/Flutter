import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTap(),
    );
  }
}

class ListTap extends StatefulWidget {
  @override
  _ListTapState createState() => _ListTapState();
}

class _ListTapState extends State<ListTap> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ListTap(),
    GridTap(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text("13. CustomScroll & SliverScroll(List)"),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, int index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 16.0),
                            child: Text("List Item $index"),
                          ),
                      childCount: 20)),
            ],
          ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("List")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_on),
              title: Text("Grid")
          ),
        ],
      ),
      );
  }
}

class GridTap extends StatefulWidget {
  @override
  _GridTapState createState() => _GridTapState();
}

class _GridTapState extends State<GridTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body : CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("13. CustomScroll & SliverScroll(Grid)"),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
              delegate: SliverChildBuilderDelegate(
                  (context,int index) => Container(
                    child: Center(
                      child: Text("Item $index"),
                    ),
                  ),
                childCount: 20
              ),
            )
          ],
        )
    );
  }
}

