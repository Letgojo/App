import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Community/acommpany.dart';
import 'package:triptokorea/Pages/Community/answer.dart';
import 'package:triptokorea/Pages/Community/write.dart';
import '../../config/config.dart' as config;

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  var list = [];
  Future<dynamic> loaddata() async {
    var Logindata = {
      "docId": null,
      "pages": "5",
    };
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/board/post/',
        queryParameters: Logindata,
      );

      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[i]);
        }

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

  @override
  Widget build(BuildContext context) {
    loaddata();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const acommpany()));
                      },
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
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: loaddata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                }
                //error가 발생하게 될 경우 반환하게 되는 부분
                else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }
                // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                else {
                  return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 750,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = list[index];
                            String time = data['date'];
                            String userName = data['userName'];
                            String title = data['title'];
                            String imageUrl = data['imageUrl'];
                            String content = data['content'];
                            String uid = data['uid'];

                            return Card(
                              margin: EdgeInsets.all(8),
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => answer(
                                                title: title,
                                                userName: userName,
                                                time: time,
                                                content: content,
                                                uid: uid)));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white, elevation: 0),
                                  child: Row(children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1)),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/newjin2.png'),
                                          fit: BoxFit.cover),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 200),
                                          child: Text(
                                            title,
                                            style: GoogleFonts.jua(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 130, top: 10),
                                          child: Text(
                                            content,
                                            style: GoogleFonts.jua(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 50, left: 115),
                                          child: Text(
                                            time,
                                            style: GoogleFonts.jua(
                                                textStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                )
                              ]),
                            );
                          },
                        ),
                      ));
                }
              },
            )
          ],
        ))),
      ),
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
