import 'package:flutter/material.dart';

class Counseling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('방문상담'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: '방문날짜'),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: '상담내용'),
            ),
            RaisedButton(
              child: Text('예약하기'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
