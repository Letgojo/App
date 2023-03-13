import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Community/write.dart';
import 'package:image_picker/image_picker.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          SizedBox(height: 16),
          Container(
              width: 180,
              margin: EdgeInsets.only(right: 200),
              child: Row(
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text(
                      '자유게시판',
                      style: GoogleFonts.jua(
                          textStyle: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      )),
                    ),
                    onTap: () {},
                  )),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      '동행게시판',
                      style:
                          GoogleFonts.jua(textStyle: TextStyle(fontSize: 14)),
                    ),
                    onTap: () {},
                  ))
                ],
              )),
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "상품을 입력해주세요",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  //돋보기 아이콘
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("돋보기 크기 클릭");
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ))),
      floatingActionButton: Container(
        width: 70,
        height: 50,
        margin: EdgeInsets.only(bottom: 30, right: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            print("추가버튼");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const write()));
          },
          child: Icon(
            Icons.edit,
            size: 30,
          ),
        ),
      ),
    );
  }
}
