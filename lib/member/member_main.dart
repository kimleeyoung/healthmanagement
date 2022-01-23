import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_firebase/member/setting.dart';
import 'Custom_Alert_Dialog.dart';
import 'eat.dart';
import 'exercisememo.dart';
import 'member_my_schedule.dart';
import '../main.dart';
import 'member_chart.dart';
import 'member_reserve.dart';

class Membermain extends StatefulWidget {
  Membermain({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MemberMainState createState() => MemberMainState();
}

class MemberMainState extends State<Membermain> {
  final CalendarWeekController _controller = CalendarWeekController();
  @override
  void initState() {
    super.initState();
  }

  var _index = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '사용자 메인 페이지',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('사용자 메인 페이지'),
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
                  trailing: Icon(Icons.arrow_drop_down),
                  children: <Widget>[
                    ListTile(
                        title: Text('사용자 차트'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChartScreen()));
                        }),
                    ListTile(
                        title: Text('수업예약'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Memberreserve()));
                        }),
                    ListTile(
                        title: Text('신청현황'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Membermyschedule()));
                        }),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey[850],
                  ),
                  title: Text('기록'),
                  trailing: Icon(Icons.arrow_drop_down),
                  children: <Widget>[
                    ListTile(
                        title: Text('운동기록'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Exercise()));
                        }),
                    ListTile(
                        title: Text('식단기록'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHomePage()));
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _controller.jumpToDate(DateTime.now());
              setState(() {});
            },
            child: Icon(Icons.today),
          ),
          body: Column(children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1)
                ]),
                child: CalendarWeek(
                  controller: _controller,
                  height: 105,
                  showMonth: true,
                  minDate: DateTime.now().add(
                    Duration(days: -365),
                  ),
                  maxDate: DateTime.now().add(
                    Duration(days: 365),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                    setState(() {});
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  decorations: [
                    DecorationItem(
                        decorationAlignment: FractionalOffset.bottomRight,
                        date: DateTime.now(),
                        decoration: Icon(
                          Icons.today,
                          color: Colors.blue,
                        )),
                    DecorationItem(
                        date: DateTime.now().add(Duration(days: 1)),
                        decoration: Text(
                          '어린이날',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                )),
            Expanded(
              child: Center(
                child: Text(
                  '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            )
          ]),
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

class Eat {}

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
