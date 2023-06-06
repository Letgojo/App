import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../config/config.dart' as config;
import '../../Menu/menuBar.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

final storageRef = FirebaseStorage.instance.ref();

class TripYes_result2 extends StatefulWidget {
  const TripYes_result2({super.key});

  @override
  State<TripYes_result2> createState() => _TripYes_resultState2();
}

class _TripYes_resultState2 extends State<TripYes_result2> {
  late GoogleMapController mapController;
  late String temp;
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  dynamic uuid = '';
  dynamic city = "";
  dynamic district = "";
  dynamic startDay = '';
  dynamic finish = '';
  dynamic day = "0";
  String? x = "35.1938469";
  String? y = "129.1536102";
  var list1 = [];
  List<Marker> _markers = [];
  var imagelist = [];
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _asyncMethod();
      });
    });
  }

  _asyncMethod() async {
    //read 함수
    uuid = await storage.read(key: "uid");
    startDay = await storage.read(key: "start");
    finish = await storage.read(key: "finish");
    city = await storage.read(key: 'city');
    district = await storage.read(key: 'district');
    day = await storage.read(key: 'day');
    x = await storage.read(key: 'x');
    y = await storage.read(key: 'y');
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
      "name": "#☕best",
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

  Future<dynamic> imageList(String name) async {
    var Logindata = {
      'name': name,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/restaurant-img',
        queryParameters: Logindata,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        final spaceRef = await storageRef.child("food_img/${response.data[0]}");
        final imageUrl = await spaceRef.getDownloadURL();
        print(imageUrl);

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return imageUrl;
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

  Future<dynamic> imageList2(String name) async {
    var Logindata = {
      'name': name,
    };
    Dio dio = new Dio();
    print(Logindata);

    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/tour-data',
        queryParameters: Logindata,
      );
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        print(response.data);
        final spaceRef =
            await storageRef.child("original_new_img/${response.data[0]}");
        final imageUrl = await spaceRef.getDownloadURL();
        print(imageUrl);

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return imageUrl;
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

  Future<dynamic> defalutlist(
      String tour, String day, String city, String district) async {
    var Logindata = {
      'tourType': tour,
      "days": day,
      "city": city,
      "district": district,
    };
    Dio dio = new Dio();
    list = [];
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/recommand-route',
        queryParameters: Logindata,
      );
      markers.clear();

      if (response.statusCode == 200) {
        for (int i = 0; i < response.data.length; i++) {
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
                                  onPressed: () {
                                    setState(() {
                                      list.add(response.data[i]);
                                    });
                                  },
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

        var temp = {};
        temp = list[0];
        list[0] = list[2];
        list[2] = temp;
        var temp2 = {};
        temp2 = list[2];
        list[2] = list[3];
        list[3] = temp2;
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
      String link = '';
      print(response.statusCode);
      markers.clear();
      if (response.statusCode == 200) {
        for (var e in response.data) {
          if ((e['위도'] != "" && e['경도'] != "")) {
            // return Image.network(
            //   data,
            //   fit: BoxFit.cover,

            markers.add(Marker(
                markerId: MarkerId(e['이름']),
                position: LatLng(double.parse(e['위도']), double.parse(e['경도'])),
                infoWindow: InfoWindow(title: e['이름']),
                onTap: () async {
                  await imageList(e['이름']).then((value) => link = value);
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
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.all(2))
                                    ],
                                  ),
                                ),
                                Container(
                                    width: 200,
                                    height: 200,
                                    child:
                                        Image.network(link, fit: BoxFit.cover)),
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
                                  onPressed: () {
                                    setState(() {
                                      list.add(e);
                                    });
                                    Navigator.pop(context);
                                  },
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
      String link2 = '';

      markers.clear();
      if (response.statusCode == 200) {
        for (var e in response.data) {
          if ((e['위도'] != "" && e['경도'] != "" && e != Null)) {
            markers.add(Marker(
                markerId: MarkerId(e['순위']!),
                position: LatLng(double.parse(e['위도']), double.parse(e['경도'])),
                infoWindow:
                    InfoWindow(title: e['관광지명'], snippet: e['소분류 카테고리']),
                onTap: () async {
                  await imageList2(e['이름']).then((value) => link2 = value);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Container(
                            child: AlertDialog(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Padding(padding: EdgeInsets.all(2))
                                  ],
                                ),
                              ),
                              Container(
                                child: Text("카테고리 : ${e['소분류 카테고리']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black))),
                              ),
                              Container(
                                child: Text("주소 : ${e['주소']}",
                                    style: GoogleFonts.getFont('Gowun Dodum',
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black))),
                              ),
                              Container(
                                  width: 200,
                                  height: 200,
                                  child:
                                      Image.network(link2, fit: BoxFit.cover)),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    list.add(e);
                                  });
                                  Navigator.pop(context);
                                },
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
                        ));
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
                child: Container(
      height: 1000,
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
                                  ? placedata('문화관광', "${city}", "${district}")
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
          height: 400,
          child: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            markers: Set.from(markers),
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(x!), double.parse(y!)),
              zoom: 12.0,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: int.parse(day ?? 1),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              ("$day"),
                              textAlign: TextAlign.left,
                              style: GoogleFonts.getFont('Gowun Dodum',
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                          )
                        ]),
                  );
                })),
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
                  String citytitle = data['이름'];
                  // if (data['이름'] != null) {
                  data['타입'] == '음식점'
                      ? citytitle = '🥘' + data['이름']
                      : data['타입'] == '역사관광'
                          ? citytitle = '📜' + data['이름']
                          : data['타입'] == '자연관광'
                              ? citytitle = '🌳' + data['이름']
                              : data['타입'] == '체험관광'
                                  ? citytitle = '🤿' + data['이름']
                                  : data['타입'] == '문화관광'
                                      ? citytitle = '☕' + data['이름']
                                      : "";

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
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          )
                        ]),
                  );
                })),
        Container(
            child: SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              result(list);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const menuBar()));
            },
            child: Text("완료"),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff0F70BE), elevation: 0),
          ),
        ))
      ]),
    ))));
  }

  Future<String> result(dynamic list) async {
    var route = [];
    list.forEach((e) => {
          route.add({
            "type": e["타입"],
            "이름": e['이름'],
            "위도": e['위도'],
            "경도": e['경도'],
          })
        });
    print(route);
    var Logindata = {
      "uuid": "${uuid}",
      "startDay": "${startDay}",
      "endDay": "${finish}",
      'route': route,
    };
    Dio dio = new Dio();
    print(Logindata);
    print("${config.serverIP}");
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.post(
        '${config.serverIP}/location/send-route',
        data: Logindata,
      );

      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");

        /// http와 다른점은 response 값을 data로 받는다.
        var name = response.data;

        // "name", value: u)
        return "OK";
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
