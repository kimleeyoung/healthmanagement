//import 'dart:html';

import 'package:flutter/material.dart';

class Newuser extends StatefulWidget {
  @override
  NewuserState createState() => NewuserState();
}

class NewuserState extends State<Newuser> {
  @override
  void initState() {
    super.initState();
  }

  final _valueList = ['A센터', 'B센터', 'C센터','D센터','E센터'];
  var _selectedValue = 'A센터';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 120, 50, 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              initialValue: '',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              initialValue: '',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
              ),
            ),
            TextFormField(
              initialValue: '',
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            DropdownButton(
              value: _selectedValue,
              items: _valueList.map(
                (value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            RaisedButton(
              child: Text('가입하기'),
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
