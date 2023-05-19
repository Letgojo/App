import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/config.dart' as config;
import 'package:google_places_for_flutter/google_places_for_flutter.dart';

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
  }

  final Set<Marker> markers = new Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<dynamic> list = [];
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "#🥘맛집",
    },
    {
      "name": "#☕카페",
    },
    {
      "name": "#🌳자연",
    },
    {
      "name": "#📜역사",
    },
    {
      "name": "#🤿체험",
    },
  ];
  Future<dynamic> loaddata(String city, String district) async {
    var Logindata = {
      "city": city,
      "district": district,
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/restaurant',
        queryParameters: Logindata,
      );
      // print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        // response.data.map((e) => {
        //       list.add(e),
        //       markers.add(Marker(
        //           markerId: MarkerId(e['이름']),
        //           position:
        //               LatLng(double.parse(e['위도']), double.parse(e['경도'])),
        //           infoWindow: InfoWindow(title: e['이름']))),
        //     });
        print(response.data);
        for (var e in response.data) {
          print(e);
          markers.add(Marker(
              markerId: MarkerId(e['이름']),
              position: LatLng(double.parse(e['위도']), double.parse(e['경도'])),
              infoWindow: InfoWindow(title: e['이름'])));
        }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal, //횡스크롤
                itemCount: 5,
                itemBuilder: (context, index) {
                  Map<dynamic, dynamic> data = recommendMenu[index];
                  String name = data['name'];
                  return Container(
                      margin: EdgeInsets.only(right: 10, top: 10, left: 10),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          loaddata("${city}", "${district}");
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
          ],
        ),
      ),
    );
  }
}
