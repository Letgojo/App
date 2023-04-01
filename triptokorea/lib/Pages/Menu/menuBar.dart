import 'package:flutter/material.dart';
import 'package:triptokorea/Pages/Chat/ChatPage.dart';
import 'package:triptokorea/Pages/Community/Postpage.dart';
import 'package:triptokorea/Pages/Community/Community.dart';
import 'package:triptokorea/Pages/Home/Homepage.dart';
import 'package:triptokorea/Pages/Setting/Setting.dart';

class menuBar extends StatefulWidget {
  const menuBar({super.key});

  @override
  State<menuBar> createState() => menuBar_State();
}

class menuBar_State extends State<menuBar> {
  @override
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(),
          HomePage(),
          Community(),
          postpage(),
          Setting(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, //현재 보여주는 index
        onTap: (newIndex) {
          print("$newIndex 로 이동합니다");
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "커뮤니티"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "채팅"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
        ],
      ),
    );
  }
}
