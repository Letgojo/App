import 'package:flutter/material.dart';
import 'package:triptokorea/Login/%20register/%20register.dart';
import 'package:triptokorea/Login/FW_Find/FW_Find.dart';
import 'package:triptokorea/Login/ID_Find/ID_Find.dart';
import 'package:triptokorea/Login/Login.dart';
import 'Menu/menuBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyApp_State();
}

class MyApp_State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: register());
  }
}
