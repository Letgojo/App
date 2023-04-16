import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:triptokorea/Pages/Login/register/%20register.dart';
import 'package:triptokorea/Pages/Login/FW_Find/FW_Find.dart';
import 'package:triptokorea/Pages/Login/ID_Find/ID_Find.dart';
import 'package:triptokorea/Pages/Menu/menuBar.dart';
import 'package:triptokorea/models/api_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../config/config.dart' as config;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  dynamic name = ""; //user의 정보를 저장하기 위한 변수
  dynamic emailinfo = "";
  dynamic uid = "";
  dynamic passwordinfo = "";
  dynamic phone = "";
  dynamic myname = "";
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
    passwordinfo = await storage.read(key: 'passwordinfo');
    phone = await storage.read(key: 'phone');
    uid = await storage.read(key: 'uid');
    emailinfo = await storage.read(key: 'emailinfo');
    name = await storage.read(key: 'nickname');
    myname = await storage.read(key: 'myname');
    if (emailinfo != null) {
      print(uid);
      print(phone);
      print(passwordinfo);
      print(emailinfo);
      print(name);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const menuBar()));
    } else {
      print('로그인이 필요합니다 $emailinfo');
    }
  }

  //   email = TextEditingController();
  //   password = TextEditingController();

  //   //비동기로 flutter secure storage 정보를 불러오는 작업.
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _asyncMethod();
  //   });
  // }

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
                      onPressed: () async {
                        login(email.text, password.text)
                            .then((result) => {
                                  if (result == "OK")
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const menuBar()))
                                    }
                                })
                            .catchError((error) => {print(error)});
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

  Future<String> login(String email1, String password1) async {
    var Logindata = {
      'email': email1,
      'password': password1,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        '${config.serverIP}/login',
        data: Logindata,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        storage.write(key: "emailinfo", value: email1);
        storage.write(key: "nickname", value: name["userName"]);
        storage.write(key: "uid", value: name["uid"]);
        storage.write(key: "passwordinfo", value: password1);
        storage.write(key: "phone", value: name["phoneNum"]);
        storage.write(key: "myname", value: name["name"]);

        // "name", value: u)
        return "OK";
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
