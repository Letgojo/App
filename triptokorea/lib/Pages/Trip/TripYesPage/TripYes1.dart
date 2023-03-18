import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes2.dart';
import '../../Menu/menuBar.dart';

class TripYes1 extends StatefulWidget {
  const TripYes1({super.key});

  @override
  State<TripYes1> createState() => _TripYes1State();
}

class _TripYes1State extends State<TripYes1> {
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
            margin: const EdgeInsets.only(top: 20, left: 40),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text('도시',
                        style: GoogleFonts.jua(
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.black)))),
                IconButton(onPressed: () {}, icon: Icon(Icons.location_on))
              ],
            ),
          ),
          Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            width: 300,
            height: 45,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
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
          Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
            child: Row(
              children: [
                Text(
                  "인원",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Icon(Icons.person)
              ],
            ),
          ),
          Container(
            width: 100,
            height: 45,
            margin: EdgeInsets.only(right: 200),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
            child: Row(
              children: [
                Text(
                  "동행",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Icon(Icons.person)
              ],
            ),
          ),
          Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              child: SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TripYes2()));
              },
              child: Text("다음"),
            ),
          ))
        ],
      ),
    );
  }
}
