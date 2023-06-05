import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Community/Community.dart';
import 'package:triptokorea/Pages/Community/acommpany.dart';
import 'package:triptokorea/Pages/Trip/TripFirstPage/FirstPage.dart';
import '../../config/config.dart' as config;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[i]);
        }

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        // "name", value:
        return name;
      } else {
        return 'Fail';
      }
    } catch (e) {
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("2");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, //Navigator back 없애기
        iconTheme: IconThemeData(color: Colors.black),

        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  child: ElevatedButton(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 370,
                        height: 150,
                        padding: EdgeInsets.only(top: 20, left: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/test.jpeg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("여행일정 잡으러가기",
                            style: GoogleFonts.getFont('Gowun Dodum',
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))))),

              Row(
                children: [
                  Container(
                    width: 250,
                    margin: EdgeInsets.only(top: 30, left: 40),
                    child: Text(
                      "동행게시판",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    child: TextButton(
                        child: Text("더보기",
                            style: GoogleFonts.getFont('Gowun Dodum',
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const acommpany()));
                        }),
                  )
                ],
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal, //횡스크롤
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = list[index];
                                String time = data['date'];
                                String userName = data['userName'];
                                String title = data['title'];
                                String imageUrl = data['imageUrl'];
                                String content = data['content'];
                                return Container(
                                  margin: EdgeInsets.only(
                                      right: 10, top: 20, left: 10),
                                  width: 300,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Row(children: [
                                          Container(
                                            width: 100,
                                            height: 140,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1)),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/test.png'),
                                                fit: BoxFit.cover),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 100, top: 10),
                                                child: Text(
                                                  title,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 40, top: 10),
                                                child: Text(
                                                  content,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 50, left: 60),
                                                child: Text(
                                                  time,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 14)),
                                                ),
                                              )
                                            ],
                                          )
                                        ])
                                      ]),
                                );
                              },
                            ),
                          ));
                    }
                  }),
              Row(
                children: [
                  Container(
                    width: 250,
                    margin: EdgeInsets.only(top: 30, left: 40),
                    child: Text(
                      "자유게시판",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    child: TextButton(
                        child: Text("더보기",
                            style: GoogleFonts.getFont('Gowun Dodum',
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Community()));
                        }),
                  )
                ],
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 180,
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal, //횡스크롤
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = list[index];
                                String time = data['date'];
                                String userName = data['userName'];
                                String title = data['title'];
                                String imageUrl = data['imageUrl'];
                                String content = data['content'];
                                return Container(
                                  margin: EdgeInsets.only(
                                      right: 10, top: 20, left: 10),
                                  width: 300,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Row(children: [
                                          Container(
                                            width: 100,
                                            height: 140,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1)),
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/newjin.png'),
                                                fit: BoxFit.cover),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 100, top: 10),
                                                child: Text(
                                                  title,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 40, top: 10),
                                                child: Text(
                                                  content,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 50, left: 60),
                                                child: Text(
                                                  time,
                                                  style: GoogleFonts.jua(
                                                      textStyle: TextStyle(
                                                          fontSize: 14)),
                                                ),
                                              )
                                            ],
                                          )
                                        ])
                                      ]),
                                );
                              },
                            ),
                          ));
                    }
                  }),

              // Container(
              //   margin: EdgeInsets.only(top: 30),
              //   width: 350,
              //   height: 150,
              //   decoration: BoxDecoration(
              //       border: Border.all(width: 1),
              //       borderRadius: BorderRadius.circular(10)),
              // )
            ],
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: Column(children: [
      //     DrawerHeader(
      //       margin: const EdgeInsets.all(0),
      //       decoration: BoxDecoration(color: Colors.black),
      //       child: SizedBox(
      //           width: double.infinity,
      //           child: Column(
      //             children: [
      //               CircleAvatar(
      //                 radius: 36,
      //                 backgroundColor: Colors.white,
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8),
      //                   child: Icon(
      //                     Icons.person,
      //                     size: 50,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(height: 16), //상단여백

      //               Text(
      //                 "닉네임",
      //                 style: GoogleFonts.jua(
      //                     textStyle:
      //                         TextStyle(fontSize: 20, color: Colors.white)),
      //               )
      //             ],
      //           )),
      //     ),
      //     ListTile(
      //       title: Text(
      //         '메뉴1',
      //         style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
      //       ),
      //       trailing: Icon(
      //         Icons.arrow_forward_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: Text(
      //         '메뉴2',
      //         style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
      //       ),
      //       trailing: Icon(
      //         Icons.arrow_forward_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: Text(
      //         '메뉴3',
      //         style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
      //       ),
      //       trailing: Icon(
      //         Icons.arrow_forward_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: Text(
      //         '메뉴4',
      //         style: GoogleFonts.jua(textStyle: TextStyle(fontSize: 18)),
      //       ),
      //       trailing: Icon(
      //         Icons.arrow_forward_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: Text(
      //         '로그아웃',
      //         style: GoogleFonts.jua(
      //             textStyle: TextStyle(fontSize: 18, color: Colors.red)),
      //       ),
      //       trailing: Icon(
      //         Icons.arrow_forward_ios,
      //         color: Colors.black,
      //       ),
      //       onTap: () {},
      //     ),
      //   ]),
      // ),
    );
  }
}
