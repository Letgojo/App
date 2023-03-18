import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '채팅',
            style: GoogleFonts.jua(
                textStyle: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "검색어을 입력해주세요",
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
          ),
        )));
  }
}
