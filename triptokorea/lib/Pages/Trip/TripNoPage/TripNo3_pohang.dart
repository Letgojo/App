import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/Trippohang_2.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

final imageList = [
  Image.asset('assets/images/Pohang1.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Pohang2.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Pohang3.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Pohang4.jpeg', fit: BoxFit.cover),
];

class TripNo3_Pohang extends StatefulWidget {
  const TripNo3_Pohang({super.key});

  @override
  State<TripNo3_Pohang> createState() => _TripNo3_PohangState();
}

class _TripNo3_PohangState extends State<TripNo3_Pohang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Swiper(
                control: SwiperControl(),
                pagination: SwiperPagination(),
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return imageList[index];
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(children: [
                Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text(
                      "포항시",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    child: Text(
                      "✔️",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    style: ElevatedButton.styleFrom(primary: Color(0xff0F70BE)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripPohang_2()));
                    },
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "경상북도의 시. 동쪽으로는 동해와 맞닿아있고, 서쪽으로는 영천시, 남쪽으로는 경주시, 북쪽으로는 청송군, 영덕군과 접해있다. 대경권 제2도시이자 경상북도 최대도시이며 경상북도 시군 중 일반구가 설치된 유일한 지역이다. 경상북도 동부(포항시·경주시·울진군·영덕군·울릉군)의 중심 도시이기도 하다.",
                style: GoogleFonts.getFont('Gowun Dodum',
                    textStyle: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
