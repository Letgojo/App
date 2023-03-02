import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Home/Homepage.dart';

import '../../Pages/Menu/menuBar.dart';

class TripNo1 extends StatefulWidget {
  const TripNo1({super.key});

  @override
  State<TripNo1> createState() => _TripNo1State();
}

class _TripNo1State extends State<TripNo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "여행계획",
          style: GoogleFonts.jua(
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
            child: Row(
              children: [
                Text(
                  "도시",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Icon(Icons.location_on)
              ],
            ),
          ),
          Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
            child: Row(
              children: [
                Text(
                  "대중교통",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Icon(Icons.luggage)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 290,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text("버스")),
                ),
                Expanded(child: Text(" ")),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text("기차")),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
            child: Row(
              children: [
                Text(
                  "날짜",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Icon(Icons.calendar_month)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
