import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../config/config.dart' as config;

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

class TripYes_result2 extends StatefulWidget {
  const TripYes_result2({super.key});

  @override
  State<TripYes_result2> createState() => _TripYes_resultState2();
}

class _TripYes_resultState2 extends State<TripYes_result2> {
  late GoogleMapController mapController;
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  dynamic city = "";
  dynamic district = "";
  dynamic day = '';
  var list1 = [];
  List<Marker> _markers = [];
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수
    city = await storage.read(key: 'city');
    district = await storage.read(key: 'district');
    day = await storage.read(key: 'day');
  }

  final Set<Marker> markers = new Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<dynamic> list = [];
  final List<Map<String, String>> recommendMenu = const [
    {"index": "1", "name": "📝 일정"},
    {
      "index": "2",
      "name": "#🥘맛집",
    },
    {
      "index": "3",
      "name": "#☕카페",
    },
    {
      "index": "4",
      "name": "#🌳자연",
    },
    {
      "index": "5",
      "name": "#📜역사",
    },
    {
      "index": "6",
      "name": "#🤿체험",
    },
  ];
  Future<dynamic> defalutlist(
      String tour, String day, String city, String district) async {
    var Logindata = {
      'tourType': tour,
      "days": day,
      "city": city,
      "district": district,
    };
    Dio dio = new Dio();
    print(Logindata);
    list = [];
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/recommand-route',
        queryParameters: Logindata,
      );
      markers.clear();
      list.clear();
      if (response.statusCode == 200) {
        print(response.data[3]);
        for (int i = 0; i < response.data.length; i++) {
          print(response.data[i]);
          if ((response.data[i]['위도'] != "" &&
              response.data[i]['경도'] != "" &&
              response.data[i]['메뉴'] != {})) {
            // print("test${response.data[i]}");
            list.add(response.data[i]);
            // print("list$list");

            markers.add(Marker(
                markerId: MarkerId(response.data[i]['경도']),
                position: LatLng(double.parse(response.data[i]['위도']),
                    double.parse(response.data[i]['경도'])),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Container(
                          width: 800,
                          child: AlertDialog(
                            title: Row(
                              children: [
                                SizedBox(
                                  child: Text(
                                    "${response.data[i]['이름']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 100)),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.clear),
                                  ),
                                )
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "카테고리 : ${response.data[i]['카테고리']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text(
                                    "대표리뷰 : ${response.data[i]['대표리뷰']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text(
                                    "주소 : ${response.data[i]['주소']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(30)),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "내 일정 담기",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff0F70BE), elevation: 8),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }));
          }
        }
        setState(() {});

        return list;
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

  Future<dynamic> loaddata(String city, String district) async {
    var Logindata = {
      "city": city,
      "district": district,
    };
    Dio dio = new Dio();

    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/restaurant',
        queryParameters: Logindata,
      );
      print(response.statusCode);
      markers.clear();
      if (response.statusCode == 200) {
        for (var e in response.data) {
          if ((e['위도'] != "" && e['경도'] != "")) {
            markers.add(Marker(
                markerId: MarkerId(e['이름']),
                position: LatLng(double.parse(e['위도']), double.parse(e['경도'])),
                infoWindow: InfoWindow(title: e['이름']),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Container(
                          width: 800,
                          child: AlertDialog(
                            title: Row(
                              children: [
                                SizedBox(
                                  child: Text(
                                    "${e['이름']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 100)),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.clear),
                                  ),
                                )
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "카테고리 : ${e['카테고리']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text(
                                    "대표리뷰 : ${e['대표리뷰']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Container(
                                  child: Text(
                                    "주소 : ${e['주소']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(30)),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "내 일정 담기",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff0F70BE), elevation: 8),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }));
          }
        }
        setState(
          () {},
        );
        return markers;
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

  Future<dynamic> placedata(
      String tourType, String city, String district) async {
    var Logindata = {
      "tourType": tourType,
      "city": city,
      "district": district,
    };
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/tour',
        queryParameters: Logindata,
      );
      markers.clear();
      if (response.statusCode == 200) {
        print("성공");
        for (var e in response.data) {
          if ((e['위도'] != "" && e['경도'] != "" && e != Null)) {
            markers.add(Marker(
                markerId: MarkerId(e['순위']!),
                position: LatLng(double.parse(e['위도']), double.parse(e['경도'])),
                infoWindow:
                    InfoWindow(title: e['관광지명'], snippet: e['소분류 카테고리']),
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: Text(
                              "${e['관광지명']}",
                              style: GoogleFonts.getFont('Gowun Dodum',
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            content: Text("라따뚜이.",
                                style: GoogleFonts.getFont('Gowun Dodum',
                                    textStyle: TextStyle(
                                        fontSize: 15, color: Colors.black))),
                            actions: [
                              Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                      child: Text(
                                        "확인",
                                        style: GoogleFonts.getFont(
                                            'Gowun Dodum',
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                      ),
                                      onPressed: () {}))
                            ],
                          ),
                        );
                      });
                }));
          }
        }
        setState(
          () {},
        );
        return markers;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      Container(
        height: 75,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal, //횡스크롤
          itemCount: 6,
          itemBuilder: (context, index) {
            Map<dynamic, dynamic> data = recommendMenu[index];
            String name = data['name'];
            String number = data['index'];
            return Container(
                margin: EdgeInsets.only(right: 10, top: 10, left: 10),
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    number == '1'
                        ? defalutlist(
                            "자연관광", "${day}", "${city}", "${district}")
                        : number == '2'
                            ? loaddata("${city}", "${district}")
                            : number == '3'
                                ? loaddata("${city}", "${district}")
                                : number == '4'
                                    ? placedata(
                                        '자연관광', "${city}", "${district}")
                                    : number == '5'
                                        ? placedata(
                                            '역사관광', "${city}", "${district}")
                                        : number == '6'
                                            ? placedata('체험관광', "${city}",
                                                "${district}")
                                            : '';
                  },
                  child: Text(
                    name,
                    style: GoogleFonts.getFont('Gowun Dodum',
                        textStyle:
                            TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  style: TextButton.styleFrom(primary: Colors.white),
                ));
          },
        ),
      ),
      Container(
        height: 300,
        child: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          markers: Set.from(markers),
          initialCameraPosition: CameraPosition(
            target: LatLng(35.1938469, 129.1536102),
            zoom: 12.0,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 340),
        child: Text(
          "여행일정",
          textAlign: TextAlign.end,
          style: GoogleFonts.getFont('Gowun Dodum',
              textStyle: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = list[index];
                String citytitle = '11111';
                // if (data['이름'] != null) {
                data['타입'] == '음식점'
                    ? citytitle = '🥘' + data['이름']
                    : data['타입'] == '역사관광'
                        ? citytitle = '📜' + data['이름']
                        : data['타입'] == '자연관광'
                            ? citytitle = '🌳' + data['이름']
                            : data['타입'] == '체험관광'
                                ? citytitle = '🤿' + data['이름']
                                : '11';

                // citytitle = data['이름'];
                // } else if (data['관광지명'] != null)
                //   citytitle = '🌳' + data['관광지명'];
                // else if (data['관광지명'] == null && data['이름'] == null) {
                //   citytitle = '안돼';
                // }
                return Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ("${citytitle}"),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.getFont('Gowun Dodum',
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )
                      ]),
                );
              }))
    ]))));
  }
}
