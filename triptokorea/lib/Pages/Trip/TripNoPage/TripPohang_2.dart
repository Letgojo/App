import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';

class TripPohang_2 extends StatefulWidget {
  const TripPohang_2({super.key});

  @override
  State<TripPohang_2> createState() => TripPohang_2State();
}

class TripPohang_2State extends State<TripPohang_2> {
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
          style: GoogleFonts.jua(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        height: double.maxFinite,
        margin: EdgeInsets.only(top: 150),
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
                    "북구",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {},
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
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text(
                    "다음",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripYes2()));
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
