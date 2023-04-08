import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo1.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Container(
                    width: 230,
                    margin: EdgeInsets.only(top: 150),
                    child: Text(
                      "여행 계획 세우기",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle: TextStyle(
                            fontSize: 50,
                          )),
                    )),
                SizedBox(
                  height: 40,
                ),
                Container(
                    child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff0F70BE)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TripNo1()));
                    },
                    child: Text("다음"),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
