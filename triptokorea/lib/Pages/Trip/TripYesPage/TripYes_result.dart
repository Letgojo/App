import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triptokorea/Pages/Trip/TripYesPage/Trip_result2.dart';
import '../../../config/config.dart' as config;
import 'package:google_places_for_flutter/google_places_for_flutter.dart';

const String kakaoMapKey = '5157004dd04f0e8b82c4ba27aac81564';

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

  Future<dynamic> loaddata() async {
    var Logindata = {
      "tourType": "자연관광",
      "city": "대구광역시",
      "district": "달서구",
    };
    Dio dio = new Dio();
    print(Logindata);
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
        '${config.serverIP}/location/tour',
        queryParameters: Logindata,
      );
      // print(response.data);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        // final jsonBody = json.decode(response.data);
        print("성공");
        for (int i = 0; i < response.data.length; i++) {
          list.add(response.data[i]);
        }
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

  @override
  void initState() {
    super.initState();
  }

  File? _image;
  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);

    print("실행중");
    if (image == null) return;
    File? img = File(image.path);
    // Uint8List imagebytes = await image.readAsBytes();
    // base64Image = base64.encode(imagebytes);
    setState(() {
      _image = img;
      Navigator.of(context).pop();
      print(_image);
    });
  }

  Widget showImage() {
    if (_image == null) {
      print("없다");
      return Container();
    }
    return Image.file(_image!);
  }

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
                  target: LatLng(35.1938469, 129.1536102),
                  zoom: 12.0,
                ),
              ),
            ),
            // Container(
            //   child: SearchGooglePlacesWidget(
            //     apiKey: 'AIzaSyASCW6NUBnr3NYGyISC7MaaSvqRjqb4LsQ',
            //     // The language of the autocompletion
            //     language: 'ko',
            //     // The position used to give better recommendations. In this case we are using the user position
            //     radius: 30000,
            //     onSelected: (Place place) async {
            //       final geolocation = await place.geolocation;

            //       // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
            //       mapController.animateCamera(
            //           CameraUpdate.newLatLng(geolocation!.coordinates));
            //       mapController.animateCamera(
            //           CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            //     },
            //     onSearch: (Place place) {},
            //   ),
            // )
          ],
        ),
      ),
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
                              "카메라",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                            onPressed: () {
                              getImage(ImageSource.camera);
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
                              "앨범 가져오기",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                            onPressed: () {
                              getImage(ImageSource.gallery);
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
                              "사진없다이말이야",
                              style: GoogleFonts.jua(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TripYes_result2()));
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
        position: LatLng(35.1938469, 129.1536102),
        infoWindow: InfoWindow(title: '해운대구')));

    // loaddata()
    //     .then((data) => setState(() {
    //           data.forEach((data) {
    //             markers.add(Marker(
    //                 markerId: MarkerId(data['순위']),
    //                 position: LatLng(
    //                   double.parse(data['위도']),
    //                   double.parse(data['경도']),
    //                 ),
    //                 infoWindow: InfoWindow(title: data['관광지명'])));
    //           });
    //         }))
    //     .catchError((error) => print('error:$error'));

    // markers.add(

    return markers;
  }
}
