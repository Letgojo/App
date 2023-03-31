import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/Tripbusan_2.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

final imageList = [
  Image.asset('assets/images/busan1.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/busan2.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/busan3.jpeg', fit: BoxFit.cover),
  Image.asset('assets/images/busan4.jpeg', fit: BoxFit.cover),
];

class TripNo3_busan extends StatefulWidget {
  const TripNo3_busan({super.key});

  @override
  State<TripNo3_busan> createState() => _TripNo3_busanState();
}

class _TripNo3_busanState extends State<TripNo3_busan> {
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
                      "부산광역시",
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
                              builder: (context) => const TripBusan_2()));
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
                "대한민국 제2의 도시이자 대한민국 최초의 직할시·광역시이고 국내 최대국제무역항이 있는 제1의 항구도시, 영남권 최대 도시, 부울경과 부산·울산권의 중심도시이자 종주도시이며, 제1의 해양교통과 제2의 항공교통 김해국제공항 타이틀 등을 보유한 도시이기도 하다. 지역 내 문화 콘텐츠로는 아시아 최대의 영화제인 부산국제영화제를 비롯해 G-STAR, 부산국제모터쇼, 부산불꽃축제, 부산항 불꽃축제, 부산 비엔날레, 부산 원아시아 페스티벌, 자갈치 축제, 부산 해맞이 축제 등이 유명하다.",
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
