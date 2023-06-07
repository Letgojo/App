import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/config.dart' as config;

class FW_Find extends StatefulWidget {
  const FW_Find({super.key});

  @override
  State<FW_Find> createState() => _FW_FindState();
}

class _FW_FindState extends State<FW_Find> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "비밀번호 찾기",
            style: GoogleFonts.jua(
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
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
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
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
                    height: 48,
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      child: Text("찾기",
                          style: GoogleFonts.jua(
                              textStyle: TextStyle(fontSize: 20))),
                      onPressed: () {
                        loadata();
                      },
                    ))
              ],
            ),
          ),
        ));
  }

  Future<dynamic> loadata() async {
    var Logindata = {
      'email': email,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        '${config.serverIP}/reset-password',
        data: Logindata,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return 0;
      } else {
        print(response.statusCode);
        print("2실패 ${response.statusCode}");
        return 'Fail';
      }
    } catch (e) {
      print(e);
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }
}
