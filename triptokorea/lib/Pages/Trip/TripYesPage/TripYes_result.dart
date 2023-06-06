import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triptokorea/Pages/Trip/TripNoPage/CategoryTable.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/Trip_result2.dart';
import '../../../config/config.dart' as config;
import 'package:google_places_for_flutter/google_places_for_flutter.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';
final storageRef = FirebaseStorage.instance.ref();
final spaceRef = storageRef.child("images/b1.png");

class TripYes_result extends StatefulWidget {
  const TripYes_result({super.key});

  @override
  State<TripYes_result> createState() => _TripYes_resultState();
}

class _TripYes_resultState extends State<TripYes_result> {
  late GoogleMapController mapController;

  final Set<Marker> markers = new Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<dynamic> list = [];
  dynamic city = '';
  dynamic district = '';
  dynamic x = '';
  dynamic y = '';
  dynamic cityname = '';
  static final storage =
      new FlutterSecureStorage(); //flutter_secure_storage 사용을 위한 초기화 작업
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _asyncMethod();
      });
    });
  }

  _asyncMethod() async {
    //read 함수ß
    district = await storage.read(key: 'district');
    city = await storage.read(key: 'city');
    x = await storage.read(key: 'x');
    y = await storage.read(key: 'y');
  }

  File? _image;
  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);

    if (image == null) return;
    File? img = File(image.path);
    // Uint8List imagebytes = await image.readAsBytes();
    // base64Image = base64.encode(imagebytes);
    setState(() {
      _image = img;
      Navigator.of(context).pop();
    });
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    }
    return Image.file(_image!);
  }

  final List<Map<dynamic, dynamic>> recommendMenu = const [
    {
      'name': '강서구',
      '위도': "35.1547542",
      '경도': '128.9027555',
    },
    {
      'name': '금정구',
      '위도': "35.2588922",
      '경도': '129.0915364',
    },
    {
      'name': '남구',
      '위도': "35.1254328",
      '경도': '129.0942767',
    },
    {
      'name': '동구',
      '위도': "35.1290483",
      '경도': '129.0446982',
    },
    {
      'name': '동래구',
      '위도': "35.206214",
      '경도': '129.0792207',
    },
    {
      'name': '부산진구',
      '위도': "35.1652494",
      '경도': '129.0430314',
    },
    {
      'name': '북구',
      '위도': "35.2292556",
      '경도': '129.0234631',
    },
    {
      'name': '사상구',
      '위도': "35.1580273",
      '경도': '128.9865896',
    },
    {
      'name': '사하구',
      '위도': "35.0899401",
      '경도': '128.9744881',
    },
    {
      'name': '서구',
      '위도': "35.1030941",
      '경도': '129.0148985',
    },
    {
      'name': '수영구',
      '위도': "35.1613118",
      '경도': '129.1112042',
    },
    {
      'name': '연제구',
      '위도': "35.1824046",
      '경도': '129.0829635',
    },
    {
      'name': '영도구',
      '위도': "35.0787475",
      '경도': '129.064765',
    },
    {
      'name': '중구',
      '위도': "35.1054698",
      '경도': '129.031545',
    },
    {
      'name': '해운대구',
      '위도': "35.1938469",
      '경도': '129.1536102',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 659.4,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: getmarkers(),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(x), double.parse(y)),
                  zoom: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          getImage(ImageSource.camera);
        },
        label: Text('카메라'),
        icon: Icon(Icons.photo_camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Set<Marker> getmarkers() {
    markers.add(Marker(
        markerId: MarkerId('1'),
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Container(
                  width: 400,
                  height: 500,
                  child: AlertDialog(
                    content: Text("선택하세요~",
                        style: GoogleFonts.jua(
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.black))),
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: 50),
                        width: 200,
                        child: ElevatedButton(
                            child: Text(
                              "자동",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TripYes_result2())); //CategoryTable
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 50),
                        width: 200,
                        child: ElevatedButton(
                            child: Text(
                              "수동",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryTable()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.white)),
                      )
                    ],
                  ),
                );
              });
        },
        position: LatLng(double.parse(x), double.parse(y)),
        infoWindow: InfoWindow(title: district)));

    // loaddata()
    //     .then((data) => setState(() {
    //           data.forEach((data) {

    //                 infoWindow: InfoWindow(title: data['관광지명'])));
    //           });
    //         }))
    //     .catchError((error) => print('error:$error'));

    // markers.add(

    return markers;
  }
}
