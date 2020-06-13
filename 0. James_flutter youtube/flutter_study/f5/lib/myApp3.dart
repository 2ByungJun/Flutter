import 'package:flutter/material.dart';

class MyApp3 extends StatelessWidget {
  final String imageUrl;
  MyApp3(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Hero"),
        backgroundColor: Colors.green[200],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              //color: Colors.blue[200],
              child: Center(
                child: Hero(
                  tag: imageUrl,
                  child: Container(
                    width: 400.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(imageUrl),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[200],
      ),
    );
  }
}