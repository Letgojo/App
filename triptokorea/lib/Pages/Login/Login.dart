import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:triptokorea/Pages/Login/register/%20register.dart';
import 'package:triptokorea/Pages/Login/FW_Find/FW_Find.dart';
import 'package:triptokorea/Pages/Login/ID_Find/ID_Find.dart';
import 'package:triptokorea/Pages/Menu/menuBar.dart';
import 'package:triptokorea/models/api_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Api>(builder: (context, Api, child) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: 400,
                margin: EdgeInsets.only(left: 10, top: 40),
                padding: EdgeInsets.only(left: 20, top: 60),
                child: Text(
                  "Welcome!",
                  style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 40)),
                ),
              ),
              Container(
                width: 400,
                margin: EdgeInsets.only(top: 40),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "email",
                    hintText: "이메일를 입력해주세요",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 400,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "암호",
                    hintText: "암호를 입력해주세요",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  obscureText: true,
                ),
              ),
              // Container(
              //     width: 400,
              //     child: ElevatedButton(
              //         child: Text(
              //           "아이디찾기",
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const ID_Find()));
              //         },
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.white,
              //             shadowColor: Colors.white))),
              Container(
                  width: 400,
                  margin: EdgeInsets.only(right: 230),
                  child: TextButton(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FW_Find()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white))),
              Container(
                  width: 400,
                  margin: EdgeInsets.only(right: 290),
                  child: TextButton(
                      child: Text(
                        "Sign up?",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const register()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white))),
              Container(
                  width: 400,
                  height: 40,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      child: Text("로그인",
                          style: GoogleFonts.jua(
                              textStyle: TextStyle(fontSize: 20))),
                      onPressed: () {
                        Api.login(email.text, password.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const menuBar()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))))
            ]),
          ),
        ),
      );
    });
  }
}
