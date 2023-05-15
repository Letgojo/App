import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:triptokorea/Pages/Community/Community.dart';
import 'package:triptokorea/models/api_service.dart';
import '../../config/config.dart' as config;
import 'package:firebase_storage/firebase_storage.dart';

class write extends StatefulWidget {
  const write({super.key});

  @override
  State<write> createState() => _WriteState();
}

class _WriteState extends State<write> {
  dynamic name = "";
  dynamic email = "";
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
    email = await storage.read(key: 'emailinfo');
    print(name);
  }

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  File? _image;
  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    Future getImage(ImageSource source) async {
      final image = await picker.pickImage(source: source);

      print("실행중");
      if (image == null) return;
      File? img = File(image.path);
      // Uint8List imagebytes = await image.readAsBytes();
      // base64Image = base64.encode(imagebytes);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
        print(_image);
      });
    }

    Widget showImage() {
      if (_image == null) {
        print("어ㅂ사");
        return Container();
      }
      return Image.file(_image!);
    }

    return Consumer<Api>(builder: (context, Api, child) {
      return Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: 370,
            margin: EdgeInsets.only(top: 20, left: 20),
            decoration: BoxDecoration(
                border: Border.all(width: 0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                    Container(
                        margin: EdgeInsets.only(left: 120),
                        child: Text(
                          "글쓰기",
                          style: GoogleFonts.jua(
                              textStyle: TextStyle(fontSize: 14)),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 120, top: 10),
                        child: ElevatedButton(
                            child: Text(
                              "완료",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(fontSize: 15)),
                            ),
                            onPressed: () {
                              _image == "null"
                                  ? Upload(title.text, content.text)
                                  : upload(title.text, content.text, _image);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff0030AC),
                              minimumSize: Size.zero,
                              padding: EdgeInsets.all(3),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            )))
                  ],
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: "제목",
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: content,
                        decoration: InputDecoration(
                            hintText: "내용", border: InputBorder.none),
                      ),
                      _image == null ? Container() : showImage()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 300),
                  child: IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Container(
                                width: 400,
                                height: 300,
                                child: AlertDialog(
                                  content: Text("선택하세요~",
                                      style: GoogleFonts.jua(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black))),
                                  actions: [
                                    Container(
                                      margin: EdgeInsets.only(right: 50),
                                      width: 200,
                                      child: ElevatedButton(
                                          child: Text(
                                            "카메라",
                                            style: GoogleFonts.jua(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black)),
                                          ),
                                          onPressed: () {
                                            getImage(ImageSource.camera);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shadowColor: Colors.white)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 50),
                                      width: 200,
                                      child: ElevatedButton(
                                          child: Text(
                                            "앨범 가져오기",
                                            style: GoogleFonts.jua(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black)),
                                          ),
                                          onPressed: () {
                                            getImage(ImageSource.gallery);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shadowColor: Colors.white)),
                                    )
                                  ],
                                ),
                              );
                            });
                      }),
                )
              ],
            ),
          ),
        ),
      ));
    });
  }

  void upload(String title, String content, base64Image) async {
    var uploadcase = {
      'email': email,
      'userName': name,
      'title': title,
      'content': content,
      'imageBinary': base64Image,
    };

    Dio dio = new Dio();
    print("실행중");
    dio.options.headers['content-Type'] = 'application/json';
    print(uploadcase);
    try {
      var response = await dio.post(
        'http://wslconnect.iptime.org:50020/board/post',
        data: uploadcase,
      );

      print(response.data);
      print(response.statusCode);
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
  }

  void Upload(String title, String content) async {
    var uploadcase2 = {
      'email': email,
      'userName': name,
      'title': title,
      'content': content,
    };

    Dio dio = new Dio();
    print("실행중");

    print(uploadcase2);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        '${config.serverIP}/board/post',
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
}
