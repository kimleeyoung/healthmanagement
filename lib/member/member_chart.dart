import 'package:flutter/material.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';

class Memberchart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '사용자 차트',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ChartScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class ChartScreen extends StatefulWidget {
  ChartScreen({Key key, this.title}) : super(key: key);
  final String title;
   @override
   State<StatefulWidget> createState() => _MemberchartState();
}

class _MemberchartState extends State<ChartScreen> {
  List<LineChartModel> data = [
    LineChartModel(amount: 300, date: DateTime(2020, 1, 1)),
    LineChartModel(amount: 200, date: DateTime(2020, 1, 2)),
    LineChartModel(amount: 300, date: DateTime(2020, 1, 3)),
    LineChartModel(amount: 500, date: DateTime(2020, 1, 4)),
    LineChartModel(amount: 800, date: DateTime(2020, 1, 5)),
    LineChartModel(amount: 200, date: DateTime(2020, 1, 6)),
    LineChartModel(amount: 120, date: DateTime(2020, 1, 7)),
    LineChartModel(amount: 140, date: DateTime(2020, 1, 8)),
    LineChartModel(amount: 110, date: DateTime(2020, 1, 9)),
    LineChartModel(amount: 250, date: DateTime(2020, 1, 10)),
    LineChartModel(amount: 390, date: DateTime(2020, 1, 11)),
    LineChartModel(amount: 1300, date: DateTime(2020, 1, 12)),
  ];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      data = [
        LineChartModel(amount: 500, date: DateTime(2020, 1, 4)),
        LineChartModel(amount: 200, date: DateTime(2020, 1, 2)),
        LineChartModel(amount: 200, date: DateTime(2020, 1, 6)),
        LineChartModel(amount: 800, date: DateTime(2020, 1, 5)),
        LineChartModel(amount: 1300, date: DateTime(2020, 1, 12)),
        LineChartModel(amount: 300, date: DateTime(2020, 1, 3)),
        LineChartModel(amount: 120, date: DateTime(2020, 1, 7)),
        LineChartModel(amount: 250, date: DateTime(2020, 1, 10)),
        LineChartModel(amount: 140, date: DateTime(2020, 1, 8)),
        LineChartModel(amount: 100, date: DateTime(2020, 1, 1)),
        LineChartModel(amount: 390, date: DateTime(2020, 1, 11)),
        LineChartModel(amount: 110, date: DateTime(2020, 1, 9)),
        LineChartModel(amount: 410, date: DateTime(2020, 4, 9)),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    Paint circlePaint = Paint()..color = Colors.black;

    Paint insideCirclePaint = Paint()..color = Colors.white;

    Paint linePaint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('사용자 차트'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // First chart
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Line chart - Line, Circles, Pointer',
                style: Theme.of(context).textTheme.headline5,
              ),
              LineChart(
                width: MediaQuery.of(context).size.width,
                height: 180,
                data: data,
                linePaint: linePaint,
                circlePaint: circlePaint,
                showPointer: true,
                showCircles: true,
                customDraw: (Canvas canvas, Size size) {},
                linePointerDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pointerDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                insideCirclePaint: insideCirclePaint,
                onValuePointer: (LineChartModelCallback value) {
                  print('${value.chart} ${value.percentage}');
                },
                onDropPointer: () {
                  print('onDropPointer');
                },
                insidePadding: 16,
              ),
            ],
          ),

          // Second Chart
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Line chart - Line, Pointer',
                  style: Theme.of(context).textTheme.headline5,
                ),
                LineChart(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  data: data,
                  linePaint: linePaint,
                  circlePaint: circlePaint,
                  showPointer: true,
                  showCircles: false,
                  customDraw: (Canvas canvas, Size size) {},
                  linePointerDecoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  pointerDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  insideCirclePaint: insideCirclePaint,
                  onValuePointer: (LineChartModelCallback value) {
                    print('${value.chart} ${value.percentage}');
                  },
                  onDropPointer: () {
                    print('onDropPointer');
                  },
                ),
              ],
            ),
          ),

          // Third chart
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Line chart - Line',
                style: Theme.of(context).textTheme.headline5,
              ),
              LineChart(
                width: MediaQuery.of(context).size.width,
                height: 180,
                data: data,
                linePaint: linePaint,
                circlePaint: circlePaint,
                showPointer: false,
                showCircles: false,
                customDraw: (Canvas canvas, Size size) {},
                linePointerDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pointerDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                insideCirclePaint: insideCirclePaint,
                onValuePointer: (LineChartModelCallback value) {
                  print('${value.chart} ${value.percentage}');
                },
                onDropPointer: () {
                  print('onDropPointer');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}