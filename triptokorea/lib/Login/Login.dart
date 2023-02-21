import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: 400,
          margin: EdgeInsets.only(left: 10, top: 80),
          child: Text(
            "Welcome!",
            style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 40)),
          ),
        ),
        Container(
          width: 400,
          margin: EdgeInsets.only(left: 20, top: 40),
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
          margin: EdgeInsets.only(left: 20, top: 20),
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
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Forgot ID",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Container(
          width: 400,
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Forgot FWD",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Container(
            width: 400,
            height: 40,
            margin: EdgeInsets.only(left: 20, top: 30),
            child: ElevatedButton(
              child: Text("로그인",
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 20))),
              onPressed: () {},
            ))
      ]),
    );
  }
}
