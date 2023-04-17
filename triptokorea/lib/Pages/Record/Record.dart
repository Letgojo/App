import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => RecordState();
}

class RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(children: [
            SizedBox(height: 16),
            Container(
                margin: EdgeInsets.only(left: 150),
                child: Row(children: [
                  Expanded(
                    child: ListTile(
                      title: Text('나의 기록',
                          style: GoogleFonts.getFont(
                            'Gowun Dodum',
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.black),
                          )),
                    ),
                  )
                ])),
            Container(
              height: 80,
              width: 380,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "검색어를 입력해주세요",
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
            Container(
              width: 360,
              height: 130,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 180),
                          child: Icon(Icons.delete_outline),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, right: 180),
                          child: Text("대구"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, right: 150),
                          child: Text("4.1 ~ 4.3"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 80),
                          child: Text("04.20  18:15저장"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]))),
        ));
  }
}
//앱바로 만들던가 알아서