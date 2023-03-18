import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo1.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/TripYes1.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
                width: 230,
                margin: EdgeInsets.only(top: 200),
                child: Text(
                  "여행 목적지를 정하셨나요 ?",
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 40)),
                )),
            Container(
                child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TripYes1()));
                },
                child: Text("예"),
              ),
            )),
            Container(
                child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TripNo1()));
                },
                child: Text("아니요"),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
