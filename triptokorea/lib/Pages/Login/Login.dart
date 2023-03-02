import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Login/%20register/%20register.dart';
import 'package:triptokorea/Pages/Login/FW_Find/FW_Find.dart';
import 'package:triptokorea/Pages/Login/ID_Find/ID_Find.dart';
import 'package:triptokorea/Pages/Menu/menuBar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 50, top: 80),
            padding: EdgeInsets.only(left: 20, top: 60),
            child: Text(
              "Welcome!",
              style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 40)),
            ),
          ),
          Container(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                labelText: "아아디",
                hintText: "아이디를 입력해주세요",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Container(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                labelText: "암호",
                hintText: "암호를 입력해주세요",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
          ),
          Container(
              width: 400,
              child: ElevatedButton(
                  child: Text(
                    "아이디찾기",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ID_Find()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, shadowColor: Colors.white))),
          Container(
              width: 400,
              child: ElevatedButton(
                  child: Text(
                    "비밀번호 찾기",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const FW_Find()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, shadowColor: Colors.white))),
          Container(
              width: 400,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  child: Text(
                    "회원가입",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const register()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, shadowColor: Colors.white))),
          Container(
              width: 400,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  child: Text("로그인",
                      style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 20))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const menuBar()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))))
        ]),
      ),
    );
  }
}
