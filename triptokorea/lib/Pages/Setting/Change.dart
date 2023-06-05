import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/config.dart' as config;

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => ChangeState();
}

class ChangeState extends State<Change> {
  TextEditingController currentpassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController userName = TextEditingController();

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
      setState(() {
        _asyncMethod();
      });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원정보수정",
          style: GoogleFonts.getFont('Gowun Dodum',
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 30),
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(height: 50), //상단여백
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "이름",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 100),
                              child: Text(
                                "${myname}",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                        ],
                      ))
                ]),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "아이디",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                "${emailinfo}",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                        ],
                      ))
                ]),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "현재 비밀번호",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            width: 150,
                            height: 40,
                            child: TextField(
                              controller: currentpassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "새 비밀번호",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 62),
                            width: 150,
                            height: 40,
                            child: TextField(
                              controller: newPassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "휴대폰 번호",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 62),
                            width: 150,
                            height: 40,
                            child: TextField(
                              controller: phoneNum,
                              decoration: InputDecoration(
                                hintText: '$phone',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1))),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "닉네임",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 91),
                            width: 150,
                            height: 40,
                            child: TextField(
                              controller: userName,
                              decoration: InputDecoration(
                                hintText: "$name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 70),
                      width: 120,
                      child: ElevatedButton(
                        child: Text(
                          "회원정보수정",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                        onPressed: () {
                          currentpassword.text != "" && phoneNum.text != ""
                              ? update_phone(
                                  currentpassword.text, phoneNum.text)
                              : " ";
                          currentpassword.text != "" && newPassword.text != ""
                              ? update_password(
                                  currentpassword.text, newPassword.text)
                              : " ";
                          currentpassword.text != "" && userName.text != ""
                              ? update_nickname(
                                  currentpassword.text, userName.text)
                              : " ";
                        },
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(left: 40),
                      child: ElevatedButton(
                        child: Text(
                          "취소",
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffA3A3A3)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }

  /* 
    함수 하나만 만들어서 쓰기 
    비번 변경할 땐 json 전화번호, 닉네임 값은 공백 또는 null 값으로 만들어서 서버에 전송하면 서버에서 필터링 해서 처리하도록 만들어놈
  
  */

  Future<String> update_password(
      String current_password, String new_password) async {
    var Logindata = {
      'uid': uid,
      'password': current_password,
      'newPassword': new_password,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.patch(
        '${config.serverIP}/settings',
        data: Logindata,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
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

  Future<String> update_phone(String current_password, String new_phone) async {
    var Logindata = {
      'uid': uid,
      'password': current_password,
      'phoneNum': new_phone,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.patch(
        '${config.serverIP}/settings',
        data: Logindata,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        // "name", value: u)
        return "OK";
      } else {
        print(response.statusCode);
        print("2실패 ${response.statusCode}");
        return 'Fail';
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }

  Future<String> update_nickname(
      String current_password, String new_nickname) async {
    var Logindata = {
      'uid': uid,
      'password': current_password,
      'userName': new_nickname,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.patch(
        '${config.serverIP}/settings',
        data: Logindata,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        // "name", value: u)
        return "OK";
      } else {
        print(response.statusCode);
        print("2실패 ${response.statusCode}");
        return 'Fail';
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }
}
