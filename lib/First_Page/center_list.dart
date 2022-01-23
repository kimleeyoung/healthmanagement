import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class CenterList extends StatefulWidget {
  CenterList({Key key}) : super(key: key);

  @override
  CenterListState createState() => new CenterListState();
}

class CenterListState extends State<CenterList> {
  List<Slide> slides = [];

  Function goToTab;

  @override
  void initState() {
    super.initState();

    var slide = new Slide(
      backgroundColor: Colors.white,
      title: "A 센터",
      styleTitle: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono',
      ),
      description:
          "건강검진 결과지 '비만'수치 위험군인 대상자 맞춤 운동프로그램 보유/해당 질병 관련 빅데이터 제공/수업내용 기록/식단 피드백/수업 외 앱을 통한 소통/운동습관들이기",
      styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      pathImage: "assets/센터.jpg",
      onCenterItemPress: () {},
    );
    slides.add(
      slide,
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "B 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "고혈압 판정 이후 약 처방에 대한 효과 미미, 부작용 발생 대상자 맞춤 운동프로그램 보유/해당 질병 관련 빅데이터 제공/수업내용 기록/식단 피드백/수업 외 앱을 통한 소통/운동습관들이기",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "C 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "당뇨 판정 이후 약 처방에 대한 효과 미미, 부작용 발생 대상자 맞춤 운동프로그램 보유/해당 질병 관련 빅데이터 제공/수업내용 기록/식단 피드백/수업 외 앱을 통한 소통/운동습관들이기",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "D 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "고혈압, 당뇨 판정 이후 운동을 자발적으로 하기 어려운 대상자 맞춤 운동프로그램 보유/해당 질병 관련 빅데이터 제공/수업내용 기록/식단 피드백/수업 외 앱을 통한 소통/운동습관들이기",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        title: "E 센터",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "비만 판정 이후 약 처방에 대한 효과가 미미하여 운동으로 극복해보고자 하는 대상자 맞춤 운동프로그램 보유/해당 질병 관련 빅데이터 제공/수업내용 기록/식단 피드백/수업 외 앱을 통한 소통/운동습관들이기",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/센터.jpg",
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.black54,
      size: 25.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.black54,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.blue[300],
      highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.blue[300],
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Colors.black12,
      colorActiveDot: Colors.black45,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.black,
    );
  }
}
