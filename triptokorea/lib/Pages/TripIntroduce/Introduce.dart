import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 80),
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Text(
                  "기간검색",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                Row(
                  children: [],
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
