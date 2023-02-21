import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, top: 50),
        child: Text("여행계획", style: TextStyle(fontSize: 18, fontFamily: 'Jua')),
      ),
    );
  }
}
