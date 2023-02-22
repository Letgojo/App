import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ID_Find extends StatefulWidget {
  const ID_Find({super.key});

  @override
  State<ID_Find> createState() => _ID_FindState();
}

class _ID_FindState extends State<ID_Find> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "아이디찾기",
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
        body: Container(
          width: 400,
          padding: EdgeInsets.only(left: 30, top: 50),
          child: Column(
            children: [
              Container(
                width: double.infinity,
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
                  ))
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Flexible(
                  //         child: TextField(
                  //             decoration: InputDecoration(
                  //       border: (OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10))),
                  //     ))),
                  //     Expanded(
                  //         child: TextField(
                  //             decoration: InputDecoration(
                  //       border: (OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10))),
                  //     ))),
                  //     Expanded(
                  //         child: TextField(
                  //             decoration: InputDecoration(
                  //       border: (OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10))),
                  //     )))
                  //   ],
                  // ),
                  ),
              Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: Text("찾기",
                        style: GoogleFonts.jua(
                            textStyle: TextStyle(fontSize: 20))),
                    onPressed: () {},
                  ))
            ],
          ),
        ));
  }
}
