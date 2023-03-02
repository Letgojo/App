import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripFirstPage/FirstPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, //Navigator back 없애기
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home",
          style: GoogleFonts.jua(
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
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
        child: Column(
          children: [
            Container(
                child: ElevatedButton(
                    child: Container(
                      margin: EdgeInsets.only(top: 30, left: 40),
                      width: 350,
                      height: 150,
                      padding: EdgeInsets.only(top: 100, left: 150),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/3.jpeg'),
                              fit: BoxFit.cover),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("여행일정 잡으러가기",
                          style: GoogleFonts.jua(
                              textStyle: TextStyle(fontSize: 20))),
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
                  margin: EdgeInsets.only(top: 30, left: 80),
                  child: Text(
                    "기록",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "더보기",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 40),
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Row(
              children: [
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top: 30, left: 80),
                  child: Text(
                    "여행축제소개",
                    style: GoogleFonts.jua(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "더보기",
                    style: GoogleFonts.jua(
                        textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 40),
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
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
