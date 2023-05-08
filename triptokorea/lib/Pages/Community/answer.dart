import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class answer extends StatefulWidget {
  const answer(
      {Key? key,
      required this.title,
      required this.userName,
      required this.time,
      required this.content})
      : super(key: key);
  final String title;
  final String userName;
  final String content;
  final String time;
  @override
  State<answer> createState() => answerState();
}

class answerState extends State<answer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
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
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(children: [
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
                    SizedBox(height: 16),
                    Container(
                        child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              right: 37,
                            ),
                            child: Text(widget.userName)),
                        SizedBox(height: 10),
                        Container(child: Text(widget.time))
                      ],
                    )),
                  ])),
              Container(
                margin: EdgeInsets.only(
                  right: 230,
                ),
                child: Column(
                  children: [SizedBox(height: 30), Text(widget.title)],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  children: [SizedBox(height: 10), Text(widget.content)],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 200,
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
                    decoration: InputDecoration(
                      hintText: "댓글을 입력해주세요.",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("댓글 보내기 클릭");
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
