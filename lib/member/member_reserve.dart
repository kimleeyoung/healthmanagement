import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class Memberreserve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '수업 예약',
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final Map<DateTime, List<NeatCleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1):
        [
      NeatCleanCalendarEvent('PT Day1',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 50),
          description: '피티 시작이다 파이팅!!',
          color: Colors.blue[700]),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
        [
      NeatCleanCalendarEvent('PT Day2',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 3, 10, 50),
          description: '오늘은 벤치프레스 알려줬으면..',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5):
        [
      NeatCleanCalendarEvent('PT Day3',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 5, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 5, 10, 50),
          description: '오늘은 뭘 배울려나',
          color: Colors.blue),
    ],
  };

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('수업 예약'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['일', '월', '화', '수', '목', '금', '토'],
          events: _events,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.blue,
          todayColor: Colors.blue,
          eventColor: Colors.orange,
          locale: 'en_US',
          todayButtonText: 'Move Today',
          expandableDateFormat: 'yyyy년 MM월 dd일 EEEE',
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
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
            title: Text('알림'),
            icon: Icon(Icons.alarm),
          ),
        ],
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
