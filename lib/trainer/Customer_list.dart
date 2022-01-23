import 'package:flutter/material.dart';
import 'list_detail.dart';
import 'trainer_main.dart';

class CustomerList extends StatefulWidget {
  CustomerList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CustomerListState createState() => CustomerListState();
}

class CustomerListState extends State<CustomerList> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '명단 페이지',
        home: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Trainermain()));
                    });
              },
            ),
            title: Column(
              children: [
                Text('~님', style: TextStyle(fontSize: 25.0)),
                GestureDetector(
                  child: Text('명단', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Column(
              children: [
                RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.account_circle),
                        Text('~님'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListDetail()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.account_circle),
                        Text('~님'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListDetail()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
                RaisedButton(
                    child: Row(
                      children: [
                        Icon(Icons.account_circle),
                        Text('~님'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListDetail()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    hoverColor: Colors.black87),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            currentIndex: _index,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text('홈'),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text('채팅'),
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm),
                title: Text('알림'),
              ),
            ],
          ),
        ));
  }
}
