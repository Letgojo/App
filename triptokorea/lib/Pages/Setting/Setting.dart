import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Login/Login.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, //Navigator back 없애기
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home",
          style: GoogleFonts.jua(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(height: 16), //상단여백

              Text(
                "닉네임",
                style: GoogleFonts.jua(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              ListTile(
                title: Text(
                  '회원정보 수정',
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Tour Planner 소개',
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  '회원탈퇴',
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {},
              ),

              ListTile(
                title: Text(
                  '로그아웃',
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 18, color: Colors.red)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
