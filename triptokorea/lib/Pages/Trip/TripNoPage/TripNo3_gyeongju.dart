import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripGyeongju_2.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

final imageList = [
  Image.asset('assets/images/Gyeongju1.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Gyeongju1.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Gyeongju2.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/Gyeongju3.jpeg', fit: BoxFit.cover),
];

class TripNo3_gyeongju extends StatefulWidget {
  const TripNo3_gyeongju({super.key});

  @override
  State<TripNo3_gyeongju> createState() => _TripNo3_gyeongjuState();
}

class _TripNo3_gyeongjuState extends State<TripNo3_gyeongju> {
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
                      "경주시",
                      style: GoogleFonts.jua(
                          textStyle:
                              TextStyle(fontSize: 18, color: Colors.black)),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 200),
                  child: ElevatedButton(
                    child: Text(
                      "👏",
                      style: GoogleFonts.jua(
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
                              builder: (context) => const TripGyeongju_2()));
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
                "한반도에서 역사가 가장 오래된 도시 중 한 곳으로, 고대 한반도에 존속했던 국가 신라의 수도인 서라벌(금성)으로서 약 천 년간 발전하였다. 《삼국사기》 및 《삼국유사》의 기록에 따르면 기원전 57년 6월 8일에 첫 성읍국가인 사로국이 경주 계림 일대에 세워졌는데, 비슷한 시기에 고조선의 왕검성이 함락되었으니 경주시는 도시 전체가 고풍스럽고 역사적 무대라 할 수 있다. 이러한 점에서 경주시는 매년 6월 8일을 '경주 시민의 날'로 정해 기념하고 있다.",
                style: GoogleFonts.jua(
                    textStyle: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
