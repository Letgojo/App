import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:provider/provider.dart';
import 'package:triptokorea/Pages/Login/Login.dart';
import 'package:triptokorea/models/api_service.dart';
import 'package:triptokorea/models/auth_service.dart';
import 'package:triptokorea/models/registerSerivce.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController PwdController = TextEditingController();
  TextEditingController Pwdckeck = TextEditingController();
  TextEditingController ninkname = TextEditingController();
  TextEditingController poneNum = TextEditingController();

  BsSelectBoxController _select1 = BsSelectBoxController(options: [
    BsSelectBoxOption(value: "서울", text: Text('서울')),
    BsSelectBoxOption(value: "부산", text: Text('부산')),
    BsSelectBoxOption(value: "대구", text: Text('대구')),
  ]);
  static const BsSelectBoxStyle outline =
      BsSelectBoxStyle(borderRadius: BorderRadius.all(Radius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Consumer<Api>(
      builder: (context, Api, child) {
        return Builder(
          builder: (context) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    "회원가입",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                          "이메일",
                          style: GoogleFonts.jua(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: "이메일을 입력해주세요",
                                border: (OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                              ))),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 30),
                        child: Text(
                          "이름",
                          style: GoogleFonts.jua(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: name,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(
                                    r'[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ]'))
                              ],
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: PwdController,
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: Pwdckeck,
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: ninkname,
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 30),
                          child: TextField(
                              controller: poneNum,
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black)),
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
                              child: BsSelectBox(
                                  hintText: "지역", controller: _select1),
                            ),
                            Expanded(
                                child: BsSelectBox(
                                    hintText: "구", controller: _select1)),
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
                            onPressed: () {
                              Api.api(email.text, PwdController.text,
                                  name.text, ninkname.text, poneNum.text);

                              // if (IdController.text.isNotEmpty &&
                              //     PwdController.text.isNotEmpty &&
                              //     name.text.isNotEmpty &&
                              //     poneNum.text.isNotEmpty &&
                              //     ninkname.text.isNotEmpty) {
                              //   registerSerivce.create(
                              //       IdController.text,
                              //       name.text,
                              //       PwdController.text,
                              //       ninkname.text,
                              //       poneNum.text);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Login()));
                            },
                          )),
                    ],
                  ),
                )));
          },
        );
      },
    );
  }
}
