import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => DeleteState();
}

class DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "회원탈퇴",
            style: GoogleFonts.jua(
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 40, top: 60),
              child: Text(
                "계정 비밀번호",
                style: GoogleFonts.jua(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black)),
              ),
            ),
            Container(
                width: 350,
                height: 60,
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                    //controller: password, //비번 api들고와
                    decoration: InputDecoration(
                  hintText: "비밀번호를 입력해주세요",
                  border: (OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
                ))),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 350,
              child: Text(
                "※ 탈퇴 및 가입을 반복할 경우, 서비스 악용 방지를 위해 재가입이 제한됩니다.",
                style: GoogleFonts.jua(
                    textStyle: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 350,
              child: Text(
                "※ 탈퇴 후 개인 정보 등의 데이터가 삭제되며 복구할 수 없습니다.",
                style: GoogleFonts.jua(
                    textStyle: TextStyle(fontSize: 17, color: Colors.grey)),
              ),
            ),
            Container(
                width: 300,
                height: 45,
                margin: const EdgeInsets.only(top: 70),
                child: ElevatedButton(
                  onPressed: () {}, //탈퇴 api들고와
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffD50000),
                  ),
                  child: Text("회원탈퇴",
                      style: GoogleFonts.jua(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white))),
                )),
          ]))),
        ));
  }
}
