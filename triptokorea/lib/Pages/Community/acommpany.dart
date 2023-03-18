import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Community/Community.dart';

class acommpany extends StatefulWidget {
  const acommpany({super.key});

  @override
  State<acommpany> createState() => acommpany_State();
}

class acommpany_State extends State<acommpany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
      SizedBox(height: 16),
      Container(
          width: 180,
          margin: EdgeInsets.only(right: 200),
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                title: Text(
                  '자유게시판',
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(
                    fontSize: 14,
                  )),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Community()));
                },
              )),
              Expanded(
                  child: ListTile(
                title: Text(
                  '동행게시판',
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  )),
                ),
                onTap: () {},
              ))
            ],
          ))
    ]))));
  }
}
