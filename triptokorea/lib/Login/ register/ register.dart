import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  BsSelectBoxController _select1 = BsSelectBoxController(options: [
    BsSelectBoxOption(value: "서울", text: Text('서울')),
    BsSelectBoxOption(value: "부산", text: Text('부산')),
    BsSelectBoxOption(value: "대구", text: Text('대구')),
  ]);
  static const BsSelectBoxStyle outline =
      BsSelectBoxStyle(borderRadius: BorderRadius.all(Radius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "회원가입",
            style: GoogleFonts.jua(
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          width: 400,
          padding: EdgeInsets.only(left: 30, top: 50),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "아이디",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "아이디를 입력해주세요",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "이름",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "이름을 입력해주세요",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "비밀번호",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "비밀번호",
                    hintText: "비밀번호를 입력해주세요",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "비밀번호확인",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "비밀번호확인",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "닉네임",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "닉네임",
                    hintText: "닉네임을 입력해주세요",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "휴대폰번호",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: " '-' 빼고  입력해주세요",
                    border: (OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ))),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "주소",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                // child: BsSelectBox(
                //     hintText: 'Pilih salah satu', controller: _select1)),
                child: Row(
                  children: [
                    Expanded(
                      child: BsSelectBox(hintText: "지역", controller: _select1),
                    ),
                    Expanded(
                        child:
                            BsSelectBox(hintText: "구", controller: _select1)),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text("회원가입",
                        style: GoogleFonts.jua(
                            textStyle: TextStyle(fontSize: 20))),
                    onPressed: () {},
                  )),
            ],
          ),
        )));
  }
}
