import 'package:flutter/material.dart';
import 'package:triptokorea/Chat/ChatPage.dart';
import 'package:triptokorea/Community/Community.dart';
import 'package:triptokorea/Home/Homepage.dart';
import 'package:triptokorea/Setting/Setting.dart';
import 'package:triptokorea/TripIntroduce/Introduce.dart';

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
          Introduce(),
          Community(),
          ChatPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "여행축제소개"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "커뮤니티"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "채팅"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
        ],
      ),
    );
  }
}
