import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class registerSerivce extends ChangeNotifier {
  final data = FirebaseFirestore.instance.collection('회원관리');

  void create(String id, String name, String pwd, String nikname,
      String ponenum) async {
    await data.doc(id).set({
      'id': id, // 유저 아이디
      'name': name, // 이름
      'pwd': pwd, // 패스워드
      'nikname': nikname, //닉네임
      'ponenum': ponenum, //연락처
    });
    notifyListeners(); //화면 갱신
  }
}
