import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'trainer_main.dart';

class QA extends StatefulWidget {
  QA({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CurrentSituationState createState() => CurrentSituationState();
}

class CurrentSituationState extends State<QA> {
  String dropdownValue = '현황';
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Q&A 페이지',
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
                  child: Text('Q&A', style: TextStyle(fontSize: 15.0)),
                )
              ],
            ),
            elevation: 0.0,
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
              'Q&A',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Num',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('ID',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('질문사항',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('이**')),
                  DataCell(Text('스트레칭...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('박**')),
                  DataCell(Text('운동루틴점검...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('최**')),
                  DataCell(Text('앱사용시...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('김**')),
                  DataCell(Text('식단...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('황**')),
                  DataCell(Text('비포에프터...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('6')),
                  DataCell(Text('정**')),
                  DataCell(Text('중간점검...')),
                ]),
                DataRow(cells: [
                  DataCell(Text('7')),
                  DataCell(Text('감**')),
                  DataCell(Text('대체운동...')),
                ]),
              ],
            ),
          ]),
        ));
  }
}
