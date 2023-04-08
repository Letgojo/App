import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripDaegu_2.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

final imageList = [
  Image.asset('assets/images/daegu0.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/daegu1.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/daegu2.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/daegu3.jpeg', fit: BoxFit.cover),
];

class TripNo3_daegu extends StatefulWidget {
  const TripNo3_daegu({super.key});

  @override
  State<TripNo3_daegu> createState() => _TripNo3_daeguState();
}

class _TripNo3_daeguState extends State<TripNo3_daegu> {
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
                      "대구광역시",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    child: Text(
                      "👏",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripDaegu_2()));
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
                "대구는 북쪽으로는 팔공산 산맥, 남쪽으로는 비슬산 산맥으로 둘러싸인 평야지대이다. 유명한 분지 지형으로 대구 시가지에 높은 산들이 가로막고 있다.국가 하천인 낙동강이 대구 외곽에서 흐르고 금호강이 도심을 둘러싸고 있으며, 달성군 가창면에서 발원한 신천이 대구 시가지 정중앙에서 흘러 금호강과 합류한다. 또한, 신천 외에도 팔거천, 동화천, 달서천, 범어천, 매호천, 욱수천, 불로천, 율하천, 진천천, 대명천 등 도심 하천이 있다.대구의 도시 공간구조는 단핵방사형이며, 시가지 구조는 본 시가지에서 외곽 시가지가 방사형으로 뻗어나가는 형태이다. 대구의 본 시가지는 '단일핵'인 동성로 대구 도심부 중심에서 대구 도심 서쪽의 와룡산, 동쪽의 만촌동, 남쪽의 앞산, 북쪽의 금호강까지 동심원 형태로 대구 3차 순환도로 안팎에 골고루 형성되어 있다.",
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
