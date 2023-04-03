import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Login/Login.dart';
import 'package:triptokorea/Pages/Setting/Change.dart';
import 'package:triptokorea/Pages/Setting/Delete.dart';
import 'package:triptokorea/Pages/Setting/Introduce.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  dynamic name = "";
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  //비동기로 flutter secure storage 정보를 불러오는 작업.
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수
    name = await storage.read(key: 'nickname');
    print(name);
  }

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
          "Setting",
          style: GoogleFonts.jua(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: Column(children: [
                SizedBox(height: 30),
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
                  "${name}",
                  style: GoogleFonts.jua(
                      textStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                SizedBox(height: 20), //상단여백
                ListTile(
                  title: Text(
                    '회원정보 수정',
                    style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Change()));
                  },
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Introduce()));
                  },
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Delete()));
                  },
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
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              content: Text("로그아웃 되었습니다.다시 로그인하시기 바랍니다.",
                                  style: GoogleFonts.jua(
                                      textStyle: TextStyle(
                                          fontSize: 15, color: Colors.red))),
                              actions: [
                                ElevatedButton(
                                    child: Text(
                                      "확인",
                                      style: GoogleFonts.jua(
                                          textStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black)),
                                    ),
                                    onPressed: () {
                                      storage.delete(key: "emailinfo");
                                      storage.delete(key: "nickname");
                                      storage.delete(key: "phone");
                                      storage.delete(key: "passwordinfo");
                                      storage.delete(key: "uid");

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.white))
                              ],
                            ),
                          );
                        });
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
