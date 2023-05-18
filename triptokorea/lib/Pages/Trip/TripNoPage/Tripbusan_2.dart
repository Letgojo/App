import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

import '../TripYesPage/TripYes_result.dart';

class TripBusan_2 extends StatefulWidget {
  const TripBusan_2({super.key});

  @override
  State<TripBusan_2> createState() => TripBusan_2State();
}

class TripBusan_2State extends State<TripBusan_2> {
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  //비동기로 flutter secure storage 정보를 불러오는 작업.
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "목적지 설정",
          style: GoogleFonts.getFont('Gowun Dodum',
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "강서구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "강서구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "금정구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "금정구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "남구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "남구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "동구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "남구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "동래구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "동래구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "부산진구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "부산진구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "북구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "북구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "사상구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "사상구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "사하구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "사하구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "서구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "서구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "수영구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "수영구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "연제구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "연제구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "영도구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "영도구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "중구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    storage.write(key: "district", value: "중구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "해운대구",
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                                        storage.write(key: "district", value: "해운대구");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes_result()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
