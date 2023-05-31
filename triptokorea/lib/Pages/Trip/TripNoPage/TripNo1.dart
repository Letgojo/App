import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/TripNo2.dart';

import '../../Menu/menuBar.dart';
import '../../../config/config.dart' as config;

String Date = "";

class TripNo1 extends StatefulWidget {
  const TripNo1({super.key});

  @override
  State<TripNo1> createState() => _TripNo1State();
}

class _TripNo1State extends State<TripNo1> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TextEditingController useremail = TextEditingController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter <= 0) {
        _counter = 0;
      } else {
        _counter--;
      }
    });
  }

  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업

  //비동기로 flutter secure storage 정보를 불러오는 작업.
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {}
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "여행계획",
          style: GoogleFonts.getFont('Gowun Dodum',
              textStyle: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const menuBar()));
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   margin: const EdgeInsets.only(left: 40),
              //   child: Row(
              //     children: [
              //       TextButton(
              //           onPressed: () {},
              //           child: Text('도시',
              //               style: GoogleFonts.getFont('Gowun Dodum',
              //                   textStyle: TextStyle(
              //                       fontSize: 20, color: Colors.black)))),
              //       IconButton(onPressed: () {}, icon: Icon(Icons.location_on))
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.only(left: 120, top: 5),
              //   width: 300,
              //   height: 45,
              //   child: Text("출발지",
              //       style: GoogleFonts.getFont('Gowun Dodum',
              //           textStyle:
              //               TextStyle(fontSize: 20, color: Colors.black))),
              //   decoration: BoxDecoration(
              //       border: Border.all(width: 1),
              //       borderRadius: BorderRadius.circular(10)),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 20, left: 60, bottom: 20),
              //   child: Row(
              //     children: [
              //       Text(
              //         "대중교통",
              //         style: GoogleFonts.getFont('Gowun Dodum',
              //             textStyle:
              //                 TextStyle(fontSize: 20, color: Colors.black)),
              //       ),
              //       Icon(Icons.train)
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 60),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 100,
              //         child: Expanded(
              //             child: ElevatedButton(
              //           child: Text("버스",
              //               style: GoogleFonts.getFont('Gowun Dodum',
              //                   textStyle: TextStyle(
              //                       fontSize: 14, color: Colors.black))),
              //           style: ElevatedButton.styleFrom(
              //             primary: Colors.white,
              //           ),
              //           onPressed: () {},
              //         )),
              //       ),
              //       Container(
              //         width: 100,
              //         margin: EdgeInsets.only(left: 60),
              //         child: Expanded(
              //             child: ElevatedButton(
              //           child: Text("기차",
              //               style: GoogleFonts.getFont('Gowun Dodum',
              //                   textStyle: TextStyle(
              //                       fontSize: 14, color: Colors.black))),
              //           onPressed: () {},
              //           style: ElevatedButton.styleFrom(
              //             primary: Colors.white,
              //           ),
              //         )),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "날짜",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    Icon(Icons.calendar_month)
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Date == ""
                    ? Container(
                        child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: pickDateRange,
                            child: Text(
                                "${start.year}.${start.month}.${start.day}",
                                style: TextStyle(color: Colors.black)),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          )),
                          Padding(padding: EdgeInsets.all(10)),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: pickDateRange,
                            child: Text("${end.year}.${end.month}.${end.day}",
                                style: TextStyle(color: Colors.black)),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ))
                        ],
                      ))
                    : Text("$Date"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "인원",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    Icon(Icons.person)
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 45,
                margin: EdgeInsets.only(right: 180),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: _incrementCounter, icon: Icon(Icons.add)),
                    Text("$_counter"),
                    IconButton(
                        onPressed: _decrementCounter, icon: Icon(Icons.remove))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 70, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "동행",
                      style: GoogleFonts.getFont('Gowun Dodum',
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    Icon(Icons.person)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                width: 300,
                height: 45,
                child: TextField(
                  controller: useremail,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    hintText: "닉네임을 입력해주세요",
                  ),
                  onSubmitted: username,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    storage.write(
                        key: "day",
                        value:
                            "${(end.year + end.month + end.day) - (start.year + start.month + start.day) + 1}");
                    storage.write(
                        key: 'start',
                        value: "${start.year}.${start.month}.${start.day}");
                    storage.write(
                        key: 'finish',
                        value: "${end.year}.${end.month}.${end.day}");
                    storage.write(key: "인원", value: "$_counter");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TripNo2()));
                  },
                  child: Text("다음"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff0F70BE), elevation: 0),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  Future<dynamic> username(String email) async {
    var Logindata = {"email": email};
    Dio dio = new Dio();
    print(Logindata);
    //dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/search-user',
        queryParameters: Logindata,
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;
        // "name", value: u)
        return name;
      } else {
        print(response.statusCode);
        print("2실패 ${response.statusCode}");
        return 'Fail';
      }
    } catch (e) {
      print(e);
      Exception(e);
    } finally {
      dio.close();
    }
    return "";
  }
}
