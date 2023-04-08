import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => IntroduceState();
}

class IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "T.P 소개",
          style: GoogleFonts.getFont('Gowun Dodum',
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0xfff1f8ff),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "여행일정",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 10),
                    width: 240,
                    child: Text(
                      "계획 세우기가 어려웠던 분들, 마음에 드는 여행일정 만들어 드려요.",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(fontSize: 17)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 170, top: 20),
                    width: 85,
                    height: 85,
                    child:
                        Image.asset('assets/images/introduce_navigation.png'),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFF1),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "예산관리",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 10),
                    width: 240,
                    child: Text(
                      "여행 중 과소비 지출 방지를 위해 전체 예상 경비를 알려드려요. ",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(fontSize: 17)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 170, top: 20),
                    width: 79,
                    height: 79,
                    child: Image.asset('assets/images/introduce_money.png'),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0xffFFF1F1),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(right: 240),
                    child: Text(
                      "동행 서비스",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 10),
                    width: 260,
                    child: Text(
                      "취향이 비슷한 사람끼리 여행 가능하도록 동행 서비스를 제공해요.",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(fontSize: 17)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 170, top: 20),
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/images/introduce_people.png'),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  color: Color(0xffEBFFEC),
                ),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(right: 210),
                    child: Text(
                      "여행 기록 게시판",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 10),
                    width: 260,
                    child: Text(
                      "다녀온 여행에 관련한 게시판에서 기록이 가능하며, 사용자간 서로 소통도 가능해요.",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(fontSize: 17)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 170, top: 20),
                    width: 68,
                    height: 68,
                    child: Image.asset('assets/images/introduce_diary.png'),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
