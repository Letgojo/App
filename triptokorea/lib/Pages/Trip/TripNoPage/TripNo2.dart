import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo3_busan.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo3_daegu.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo3_gyeongju.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo3_pohang.dart';

class TripNo2 extends StatefulWidget {
  const TripNo2({super.key});

  @override
  State<TripNo2> createState() => _TripNopageState();
}

class _TripNopageState extends State<TripNo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "여행계획",
            style: GoogleFonts.getFont('Gowun Dodum',
                textStyle: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 350,
                      height: 150,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/daegu1.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("대구",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle: TextStyle(fontSize: 40))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripNo3_daegu()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))))),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 350,
                      height: 150,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/busan1.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("부산",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle: TextStyle(fontSize: 40))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripNo3_busan()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))))),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 350,
                      height: 150,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Gyeongju1.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("경주",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle: TextStyle(fontSize: 40))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripNo3_gyeongju()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))))),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 350,
                      height: 150,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/Pohang1.jpeg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("포항",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle: TextStyle(fontSize: 40))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripNo3_Pohang()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))))),
          ],
        )));
  }
}
