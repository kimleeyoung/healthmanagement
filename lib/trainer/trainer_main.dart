import 'package:flutter/material.dart';
import 'package:flutter_firebase/member/Custom_Alert_Dialog.dart';
import 'package:flutter_firebase/member/setting.dart';
import 'package:flutter_firebase/trainer/calendar.dart';
import 'Customer_list.dart';
import 'Q_A.dart';
import '../main.dart';
import 'apply.dart';

class Trainermain extends StatefulWidget {
  Trainermain({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TrainerMainState createState() => TrainerMainState();
}

class TrainerMainState extends State<Trainermain> {
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  var _pages = [Page1(), Page2(), Page3()];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '관리자 메인 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('관리자 메인 페이지'),
            centerTitle: true,
            elevation: 0.0,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/connie1.jpg'),
                    backgroundColor: Colors.white,
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/connie2.jpg'),
                      backgroundColor: Colors.white,
                    ),
                  ],
                  accountName: Text('CONNIE'),
                  accountEmail: Text('rladldud1109@naver.com'),
                  onDetailsPressed: () {
                    print('arrow is clicked');
                  },
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.event,
                    color: Colors.grey[850],
                  ),
                  title: Text('스케줄'),
                  children: <Widget>[
                    ListTile(
                        title: Text('일정&관리'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Calendar()));
                        }),
                    ListTile(
                        title: Text('신청현황'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Apply()));
                        }),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey[850],
                  ),
                  title: Text('회원관리'),
                  children: <Widget>[
                    ListTile(
                        title: Text('명단'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CustomerList()));
                        }),
                    ListTile(
                        title: Text('Q&A'),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => QA()));
                        }),
                  ],
                ),
                ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.grey[850],
                    ),
                    title: Text('설정'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Setting()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.grey[850],
                    ),
                    title: Text('로그아웃'),
                    onTap: () {
                      showAlertDialog(context);
                    }),
              ],
            ),
          ),
          body: Center(
              child: Container(
            child: Column(
              children: <Widget>[
                _pages[_index],
              ],
            ),
          )),
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
                title: Text('알림'),
                icon: Icon(Icons.alarm),
              ),
            ],
          ),
        ));
  }
}

showAlertDialog(BuildContext context) {
  var dialog = CustomAlertDialog(
      title: "Logout",
      message: "Are you sure, do you want to logout?",
      onPostivePressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Mainscreen()));
      },
      positiveBtnText: 'Yes',
      negativeBtnText: 'No');
  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
                    SizedBox(height: 30.0, child: Icon(Icons.account_circle)),
                  ],
                ),
              ]))
    );
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '채팅',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '알림',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
