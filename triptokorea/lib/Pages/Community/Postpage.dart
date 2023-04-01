import 'package:flutter/material.dart';

class postpage extends StatefulWidget {
  const postpage({super.key});

  @override
  State<postpage> createState() => _postState();
}

class _postState extends State<postpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
          backgroundColor: Colors.white,
        ),
        body: Container());
  }
}
