import 'package:flutter/material.dart';
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
    return MaterialApp(home: menuBar());
  }
}
