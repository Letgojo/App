import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => RecordState();
}

class RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(children: [
            SizedBox(height: 16),
            Container(
                margin: EdgeInsets.only(left: 150),
                child: Row(children: [
                  Expanded(
                      child: ListTile(
                    title: Text(
                      '나의 기록',
                      style: GoogleFonts.jua(
                          textStyle: TextStyle(
                        fontSize: 18,
                      )),
                    ),
                  ))
                ]))
          ]))),
        ));
  }
}
//앱바로 만들던가 알아서