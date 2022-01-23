import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Exercise extends StatefulWidget {
  @override
  ExerciseState createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }
  
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          '운동기록',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(children: [
        Container(
          child: DatePicker(
            DateTime.now(),
            width: 60,
            height: 80,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            inactiveDates: [
              DateTime.now().add(Duration(days: 3)),
              DateTime.now().add(Duration(days: 4)),
              DateTime.now().add(Duration(days: 7))
            ],
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
          margin: const EdgeInsets.all(35),
        ),
        _pages[_index],
      ])),
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
}


class Page1 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Container(
          child: Column(children: <Widget>[
            RaisedButton(
              child: Text('오늘의 운동 추가하기'),
              onPressed:()=> _create(context),
              textColor: Colors.white,
              color: Colors.black,
            ),
            FlatButton(
              child: Text('이전 운동 기록 불러오기'),
              onPressed: ()=> _create(context),
              textColor: Colors.white,
              color: Colors.blue,
            )
          ]),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '벤치프레스 3세트 20kg',
              ),
              Text(
                '데드리프트 4세트 30kg',
              ),
              Text(
                '레그프레스 4세트 30kg',
              ),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '메모',
              )),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
        ),
        TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '변화',
        ))
      ]),
    ));
  }

  void _create(BuildContext context) {
    String _name = "";
    var content = TextField(
      style: GoogleFonts.montserrat(
          color: Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
      autofocus: true,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(
            color: Color.fromRGBO(59, 57, 60, 1),
            fontSize: 18,
            fontWeight: FontWeight.normal),
        labelText: 'Workout Name',
      ),
      onChanged: (value) {
        _name = value;
      },
    );

  void clickMe() {
    print('clicked!');
  }
}
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '관리자와 소통',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '내 정보',
      style: TextStyle(fontSize: 40),
    );
  }
}