import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/config.dart' as config;

class answer extends StatefulWidget {
  const answer(
      {Key? key,
      required this.title,
      required this.userName,
      required this.time,
      required this.content,
      required this.uid})
      : super(key: key);
  final String title;
  final String userName;
  final String content;
  final String time;
  final String uid;
  @override
  State<answer> createState() => answerState();
}

class answerState extends State<answer> {
  var list = [];

  var onPressed;

  get suffixIcon => null;
  Future<dynamic> loaddata() async {
    var Logindata = {
      "docId": widget.uid,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/board/reply/',
        queryParameters: Logindata,
      );

      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[i]);
        }
        print(list);

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return name;
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

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  TextEditingController content = TextEditingController();
  dynamic name = "";
  dynamic email = "";
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수
    name = await storage.read(key: 'nickname');
    email = await storage.read(key: 'emailinfo');
  }

  @override
  Widget build(BuildContext context) {
    loaddata();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            width: 300,
                            height: 400,
                            child: AlertDialog(
                              content: Text("삭제하시겠습니까?",
                                  style: GoogleFonts.jua(
                                      textStyle: TextStyle(
                                          fontSize: 15, color: Colors.black))),
                              actions: [
                                Container(
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            postdelete();
                                          },
                                          child: Text("네",
                                              style: GoogleFonts.jua(
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)))),
                                      Padding(padding: EdgeInsets.all(4)),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("아니요",
                                              style: GoogleFonts.jua(
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black))))
                                    ],
                                  ),
                                )
                              ],
                            ));
                      });
                  //Navigator.pop(context);
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(children: [
                      SizedBox(height: 20),
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
                      SizedBox(height: 16),
                      Container(
                          child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                right: 70,
                              ),
                              child: Text(
                                widget.userName,
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )),
                          SizedBox(height: 10),
                          Container(child: Text(widget.time))
                        ],
                      )),
                    ])),
                Container(
                    margin: EdgeInsets.only(
                      right: 280,
                    ),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
                Container(
                  margin: EdgeInsets.only(right: 260, top: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        widget.content,
                        style: GoogleFonts.getFont('Gowun Dodum',
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 100,
                  ),
                ),
                Container(
                  height: 1,
                  width: 360,
                  color: Colors.grey,
                ),
                Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: content,
                      decoration: InputDecoration(
                        hintText: "댓글을 입력해주세요.",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Upload(widget.uid, email, name, content.text);
                          },
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = list[index];
                      String time = data['date'];
                      String userName = data['userName'];
                      // String title = data['title'];
                      // String imageUrl = data['imageUrl'];
                      String content = data['content'];

                      return Card(
                        //댓글
                        margin: EdgeInsets.all(8),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    radius: 36,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        userName,
                                        style: GoogleFonts.getFont(
                                            'Gowun Dodum',
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          content,
                                          style:
                                              GoogleFonts.getFont('Gowun Dodum',
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 30, left: 350),
                              child: IconButton(
                                icon: Icon(Icons.delete, size: 20),
                                onPressed: () {
                                  //replydelete();
                                },
                              ))
                        ]),
                      );
                    },
                  ),
                ),
              ]),
            )));
  }

  void Upload(
    String uid,
    String email,
    String userName,
    String content,
  ) async {
    var uploadcase2 = {
      'docId': uid,
      'email': email,
      'userName': userName,
      'content': content,
    };

    Dio dio = new Dio();
    print("실행중");

    print(uploadcase2);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        '${config.serverIP}/board/reply',
        data: uploadcase2,
      );
      print(uploadcase2);
      print(response.data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final jsonBody =
            json.decode(response.data); // http와 다른점은 response 값을 data로 받는다.
        // jsonBody를 바탕으로 data 핸들링
        print("성공");
      } else {
        // 200 안뜨면 에러
        print("실패");
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
  }

//댓글 삭제
//   Future<dynamic> replydelete() async {
//     var Logindata = {
//       "replyId": widget.uid,
//     };
//     Dio dio = new Dio();
//     print(Logindata);
//     dio.options.headers['content-Type'] = 'application/json';
//     try {
//       var response = await dio.delete(
//         '${config.serverIP}/board/reply/reply-id',
//         queryParameters: Logindata,
//       );

//       print(response.data);
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         // final jsonBody = json.decode(response.data);
//         print("성공");
//         /// http와 다른점은 response 값을 data로 받는다.
//         var name = response.data;

//         // "name", value: u)
//         return name;
//       } else {
//         print(response.statusCode);
//         print("2실패 ${response.statusCode}");
//         return 'Fail';
//       }
//     } catch (e) {
//       print(e);
//       Exception(e);
//     } finally {
//       dio.close();
//     }
//     return "";
//   }

//게시글 삭제
  Future<dynamic> postdelete() async {
    var Logindata = {
      "Id": widget.uid,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.delete(
        '${config.serverIP}/board/post/document-id',
        queryParameters: Logindata,
      );

      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return name;
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
