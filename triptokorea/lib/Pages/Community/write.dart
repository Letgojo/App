import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triptokorea/Pages/Community/Community.dart';

class write extends StatefulWidget {
  const write({super.key});

  @override
  State<write> createState() => _WriteState();
}

class _WriteState extends State<write> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    Future getImage(ImageSource source) async {
      final image = await picker.pickImage(source: source);
      print("실행중");
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: 600,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Community()));
                    },
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 120),
                      child: Text(
                        "글쓰기",
                        style:
                            GoogleFonts.jua(textStyle: TextStyle(fontSize: 14)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 120, top: 10),
                      child: ElevatedButton(
                          child: Text(
                            "완료",
                            style: GoogleFonts.jua(
                                textStyle: TextStyle(fontSize: 15)),
                          ),
                          onPressed: () {},
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
                  decoration: InputDecoration(
                    hintText: "제목",
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 420,
                margin: EdgeInsets.only(top: 0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      InputDecoration(hintText: "내용", border: InputBorder.none),
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
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image!);
    }
  }
}
