import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Chat',
          style: GoogleFonts.jua(
              textStyle: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  color: Colors.black)),
        ),
      ),
    );
  }
}
