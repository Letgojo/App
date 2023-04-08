import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes_result.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/test.dart';
import '../../Menu/menuBar.dart';

class TripYes2 extends StatefulWidget {
  const TripYes2({super.key});

  @override
  State<TripYes2> createState() => _TripYes2State();
}

class _TripYes2State extends State<TripYes2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "여행계획",
            style: GoogleFonts.getFont('Gowun Dodum',
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const menuBar()));
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        "관광",
                        style: GoogleFonts.getFont('Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "레저스포츠",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "문화관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "역사관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "자연관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "체험관광",
                        style: GoogleFonts.getFont('Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        "음식",
                        style: GoogleFonts.getFont('Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "레저스포츠",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "문화관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "역사관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "자연관광",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        "여행취향",
                        style: GoogleFonts.getFont('Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "유명한곳",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "맛집 위주",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "부지런한",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          "여유로움",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TripYes_result()));
                        },
                        child: Text("다음"),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff0F70BE)),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
